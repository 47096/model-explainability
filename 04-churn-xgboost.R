# XGBoost classification + explainability (customer churn)

library(DALEX)
library(modelStudio)
library(tidymodels)
library(tidyverse)

# Local data — no remote URL
customers <- read.csv("data/bank_churners.csv", stringsAsFactors = TRUE)
customers$still_customer <- as.factor(ifelse(customers$still_customer == "yes", 1, 0))

set.seed(222)
customers_split <- initial_split(customers, prop = 0.8, strata = still_customer)
customers_train <- training(customers_split)
customers_test <- testing(customers_split)

fit_xgboost <- boost_tree() %>%
  set_mode("classification") %>%
  set_engine("xgboost") %>%
  fit(still_customer ~ ., data = customers_train)

# DALEX expects class probability for classification
yhat_xgb <- function(object, newdata) {
  predict(object, new_data = newdata, type = "prob")$.pred_1
}

explainer <- DALEX::explain(
  model = fit_xgboost,
  data = customers_train,
  y = as.numeric(as.character(customers_train$still_customer)),
  predict_function = yhat_xgb,
  label = "XGBoost churn",
  verbose = FALSE
)

predictions <- customers_test %>%
  mutate(pred = yhat_xgb(fit_xgboost, customers_test))

# One likely stay + one likely leave for the dashboard
new_observations <- bind_rows(
  predictions %>% filter(pred < 0.5) %>% slice(1),
  predictions %>% filter(pred >= 0.5) %>% slice(1)
)
rownames(new_observations) <- c("Likely stay", "Likely leave")

modelStudio(explainer, new_observations, N = 200, B = 5)
