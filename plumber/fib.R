fib <- function(n) {
  if (n < 1) return(1)
  fib(n - 1) + fib(n - 2)
}
fib(9)
fib(32)

# Profile code (profvis::profvis())
microbenchmark::microbenchmark(

)

profvis::profvis({
fib_slow <- function(n) {
  if (n < 1) return(1)
  fib(28)
  fib_slow(n - 1) + fib_slow(n - 2)
}
  fib_slow(4)
})


# Better algorithm ? (memoise::memoise())
fib_mem <- memoise::memoise(function(n) {
  if (n < 1) return(1)
  fib_mem(n - 1) + fib_mem(n - 2)
})
fib_mem(9)
fib_mem(30)
fib_mem(300)
