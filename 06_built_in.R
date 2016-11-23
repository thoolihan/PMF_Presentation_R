source('output.R')

# https://cran.r-project.org/view=Distributions
?dpois

n <- 6
p <- (51/100)
expected <- n * p
outcomes <- 0:n

prob <- dpois(outcomes, expected)

print_plot(outcomes, prob)