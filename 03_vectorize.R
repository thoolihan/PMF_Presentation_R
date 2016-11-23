source('output.R')

pmf_scalar <- function(k, lambda) {
  return(((lambda ** k) * exp(-lambda)) / factorial(k))
}

pmf <- Vectorize(pmf_scalar)

n <- 6
p <- (51/100)
expected <- n * p
outcomes <- 0:n

prob <- pmf(outcomes, expected)

print_plot(outcomes, prob)