#!/usr/bin/env Rscript
packages <- c("DALEX", "modelStudio", "ranger", "tidymodels", "tidyverse")
install.packages(packages[!packages %in% installed.packages()[, "Package"]])
