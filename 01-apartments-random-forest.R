# Random forest regression + explainability (DALEX / modelStudio)
# Business link: what drives this outcome? Show drivers to a stakeholder.

library(DALEX)
library(ranger)
library(modelStudio)
library(tidyverse)

# Built-in regression data from DALEX (no missing remote file)
data(apartments, package = "DALEX")
set.seed(222)

split <- sample(seq_len(nrow(apartments)), size = 0.7 * nrow(apartments))
apartments_train <- apartments[split, ]
apartments_test <- apartments[-split, ]

model <- ranger(m2.price ~ ., data = apartments_train)

yhat_rf <- function(object, newdata) {
  predict(object, data = newdata)$predictions
}

explainer <- DALEX::explain(
  model = model,
  data = apartments_test,
  y = apartments_test$m2.price,
  predict_function = yhat_rf,
  label = "Random Forest",
  verbose = FALSE
)

# Interactive dashboard: breakdown, Shapley, ceteris paribus, PDP
modelStudio(
  explainer,
  new_observations = apartments_test[1:3, ],
  N = 200,
  B = 5
)
