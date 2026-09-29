# remotes::install_github("meztez/rapidoc")
library(plumber)
library(rapidoc)
plumb_api("plumber", "04-mean-sum") %>%
  pr_set_ui("rapidoc") %>%
  pr_run()

# remotes::install_github("meztez/redoc")
library(plumber)
library(redoc)
plumb_api("plumber", "04-mean-sum") %>%
  pr_set_ui("redoc") %>%
  pr_run()
