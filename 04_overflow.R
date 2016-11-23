source('output.R')

# https://en.wikipedia.org/wiki/Poisson_distribution#Definition
pmf <- function(k, lambda) {
  return(((lambda ** k) * exp(-lambda)) / factorial(k))
}

n <- 1000
p <- (51/100)
expected <- n * p
outcomes <- 0:n

prob <- pmf(outcomes, expected)

print_plot(outcomes, prob)