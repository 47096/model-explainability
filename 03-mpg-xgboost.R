# XGBoost regression + explainability (mpg → highway fuel economy)

library(DALEX)
library(modelStudio)
library(tidymodels)
library(tidyverse)

data_tbl <- mpg %>%
  select(hwy, manufacturer:drv, fl, class)

fit_xgboost <- boost_tree(learn_rate = 0.3) %>%
  set_mode("regression") %>%
  set_engine("xgboost") %>%
  fit(hwy ~ ., data = data_tbl)

yhat_xgb <- function(object, newdata) {
  predict(object, new_data = newdata)$.pred
}

explainer <- DALEX::explain(
  model = fit_xgboost,
  data = data_tbl,
  y = data_tbl$hwy,
  predict_function = yhat_xgb,
  label = "XGBoost",
  verbose = FALSE
)

modelStudio(explainer, N = 200, B = 5)
