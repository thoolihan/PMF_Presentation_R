source('output.R')
library(rbenchmark)

# https://cran.r-project.org/view=Distributions
pmf <- function(k, lambda) {
  return(exp(k * log(lambda) - lambda - lgamma(k+1)))
}

n <- 5000
p <- (51/100)
expected <- n * p
outcomes <- 0:n

?benchmark
df <- data.frame(x = outcomes)
b_pois <- benchmark(df$y <- dpois(outcomes, expected))
b_custom <- benchmark(df$y_custom <- pmf(outcomes, expected))
delta <- b_custom$elapsed - b_pois$elapsed

print(paste("Difference of ", 
            format(delta, digits=6),
            "ms on ",
            b_pois$replications,
            " iterations (",
            format(100 * delta / b_pois$elapsed, digits=6),
            "%)",
            sep=""))
