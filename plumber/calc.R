

fast_calc <- function() {
  "fast!"
}

slow_calc <- function(n = 8) {
  Sys.sleep(n)
  "slow!"
}




fib(3)
fib(5)
profvis::profvis({
  fib <- function(n) {
    if (n < 2) return(1)
    # rand <- runif(1 * 1000 * 1000)
    # rand_sorted <- sort(rand)
    # min_rand <- min(rand_sorted)
    fib(n - 1) + fib(n - 2)
  }
  fib(28)
  # O(2^n)
})

fib_m <- memoise::memoise(function(n) {
  if (n < 2) return(1)
  # rand <- runif(1 * 1000 * 1000)
  # rand_sorted <- sort(rand)
  # min_rand <- min(rand_sorted)
  fib_m(n - 1) + fib_m(n - 2)
})

fib_m(300)
# O(n)

runif_mem <- memoise::memoise(runif)
runif_mem(10)

