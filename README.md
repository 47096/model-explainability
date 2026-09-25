# Why did the model decide that?

**A trust problem, solved with explainability.**

Leaders will not fund — or defend — a black box. I help teams **open the model**: what drove this score, which features matter, and how algorithms disagree when you ask *why*.

---

## The stake

A high AUC does not get a budget approved. If you cannot explain a credit denial, a churn flag, or a risk score to a stakeholder (or a regulator), the model stays on the shelf — or becomes a liability.

## The story

Training is easy. **Explaining is the work.**

I built four models across regression and classification — random forest, logistic regression, XGBoost — then asked the same explainability questions of each:

- **What drove this one prediction?** (local)  
- **What matters overall?** (global)  
- **What if this feature moved?** (what-if)  

**Outcome on this build:**
- Interactive dashboards you can show a non-technical stakeholder  
- Clear contrast: spreads vs concentrates importance across models  
- Coefficient models stay easy to defend; trees need **explicit** explainability  

> **The commercial idea:** ship models people can **argue with** — not just score with.

---

## What that looks like in your world

| You have | I turn it into |
|----------|----------------|
| A model with good metrics | A **reason story** for each score |
| “Why was this customer flagged?” | Feature contribution on that row |
| Board / risk / legal questions | Dashboards + plain-English drivers |
| Several candidate models | A fair **explainability comparison** |

**Typical engagement:** wrap your models in standardised explainers → local + global views → a short “how we defend this” note for stakeholders.

**[Talk to me about model trust →](https://datafying.co/#contactus)** · [datafying](https://datafying.co/)

---

## Why leaders bring me in

- Explains **decisions**, not just accuracy tables  
- Same lens across algorithms — avoids one-model dogma  
- Built for **conversations** with risk, product, and ops  
- Honest about limits: explanation ≠ causality  

---

## Proof of craft *(technical)*

### Four models, one explainability stack

| Script | Model | Task | Dataset |
|--------|-------|------|---------|
| `01-happiness-random-forest.R` | Random Forest | Regression | World Happiness |
| `02-titanic-logistic.R` | Logistic Regression | Classification | Titanic |
| `03-mpg-xgboost.R` | XGBoost | Regression | `mpg` |
| `04-churn-xgboost.R` | XGBoost | Classification | Bank Churners |

### What the dashboards show
- **Break Down** — contribution to one prediction  
- **Shapley values** — global importance  
- **Ceteris Paribus** — what-if on a single feature  
- **Partial dependence** — average effect across the data  

### Findings
- **Random forest** — importance spread more evenly  
- **XGBoost** — concentrates on fewer features  
- **Logistic** — coefficients are easy to defend, weaker on non-linearities  

### Stack
`DALEX` · `modelStudio` · `ranger` · `tidymodels` · `tidyverse`

### Limits (honesty)
- Feature importance ≠ legal proof of fairness  
- Explainers explain the **model**, not the market  
- Still need policy and human review on material decisions  

---

## Reproduce

```bash
git clone https://github.com/47096/model-explainability.git
cd model-explainability
```

```r
source("setup.R")
source("01-happiness-random-forest.R")
# each script opens an interactive dashboard
```

**Data:** World Happiness (Kaggle) · Titanic (`DALEX`) · `mpg` · bank churners in `data/`

---

## Next step

If a model is waiting on “but can we explain it?” — that is the engagement I run.

**[Book a conversation →](https://datafying.co/#contactus)** · Analytics with accountability · [datafying](https://datafying.co/)
