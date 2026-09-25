# Logistic regression + explainability (classification)

library(DALEX)
library(modelStudio)
library(tidyverse)

data(titanic_imputed, package = "DALEX")

model_titanic <- glm(survived ~ ., data = titanic_imputed, family = "binomial")

explainer_titanic <- DALEX::explain(
  model = model_titanic,
  data = titanic_imputed,
  y = titanic_imputed$survived,
  label = "Titanic GLM",
  verbose = FALSE
)

new_observations <- titanic_imputed[1:2, ]
rownames(new_observations) <- c("Lucas", "James")

modelStudio(
  explainer_titanic,
  new_observations,
  N = 200,
  B = 5
)

# Local scores for those rows
new_observations %>%
  mutate(pred = predict(model_titanic, newdata = new_observations, type = "response"))
