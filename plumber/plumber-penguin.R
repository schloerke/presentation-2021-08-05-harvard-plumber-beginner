#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg = "") {
  list(msg = paste0("The message is: '", msg, "'"))
}

#* Return the sum of two numbers
#* @param a The first number to add
#* @param b The second number to add
#* @post /sum
function(a, b) {
  as.numeric(a) + as.numeric(b)
}


#* Plot a histogram
#* @serializer png
#* @get /plot
function(n = 100) {
  rand <- rnorm(n)
  hist(rand)
}


library(rapidoc)
# * @plumber
function(pr) {
  pr %>%
    plumber::pr_set_docs("rapidoc")
}


library(tidymodels)
tidymodels_prefer()
library(palmerpenguins)
#* Demo Model
#*
#* Split the data into training and testing, and find the `species` for the first `n` rows.
#* @serializer yaml
#* @get /penguin
function(n = floor(nrow(penguins) * 0.2)) {
  n <- as.numeric(n)
  n <- min(c(nrow(penguins), n))
  n <- max(c(n, 1))
  set.seed(1234)
  print(n)
  penguins_train <- penguins[(n+1):nrow(penguins), ]
  penguins_test <- penguins[1:n, ]

  model_fit <-
    rand_forest(trees = 200, min_n = 5) %>%
    set_engine("randomForest") %>%
    set_mode("classification") %>%
    fit(
      species ~ .,
      data = penguins_train
    )

  pred_penguins <-
    penguins_test %>%
    dplyr::select(-species) %>%
    dplyr::filter(complete.cases(.))

  predict(model_fit, pred_penguins)
}
