#!/usr/bin/env Rscript
packages <- c("DALEX", "DataExplorer", "modelStudio", "ranger", "tidymodels", "tidyverse")
install.packages(packages[!packages %in% installed.packages()[,"Package"]])
