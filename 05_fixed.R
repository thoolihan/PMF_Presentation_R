source('output.R')

# https://en.wikipedia.org/wiki/Poisson_distribution#Definition
# numerically stable version
pmf <- function(k, lambda) {
  return(exp(k * log(lambda) - lambda - lgamma(k+1)))
}

n <- 1000
p <- (51/100)
expected <- n * p
outcomes <- 0:n

prob <- pmf(outcomes, expected)

print_plot(outcomes, prob)