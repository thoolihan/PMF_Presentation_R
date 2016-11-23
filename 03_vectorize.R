source('output.R')

pmf <- function(k, lambda) {
  return(((lambda ** k) * exp(-lambda)) / factorial(k))
}

wrapped_pmf <- Vectorize(pmf)

n <- 6
p <- (51/100)
expected <- n * p
outcomes <- 0:n

prob <- wrapped_pmf(outcomes, expected)

print_plot(outcomes, prob)

# turns out, we don't need to
prob <- pmf(outcomes, expected)

print_plot(outcomes, prob)