source('output.R')

# https://en.wikipedia.org/wiki/Poisson_distribution#Definition
# lambda is the mean, k is the proposed outcomes
# result is a probability
pmf <- function(k, lambda) {
  return(((lambda ** k) * exp(-lambda)) / factorial(k))
}

n <- 6
p <- (51/100)
expected <- n * p
outcomes <- 0:n

## Avoid for loops in R
# prob = c()
# for(x in outcomes) {
#   val <- pmf(x, expected)
#   prob <- c(prob, val)
# }

# like a map function in other languages
prob <- sapply(outcomes, function(x){pmf(x, expected)})

print_plot(outcomes, prob)
print('sum of outcomes from 0 to 6:')
print(sum(prob))