source('output.R')

# https://cran.r-project.org/view=Distributions
pmf <- function(k, lambda) {
  return(exp(k * log(lambda) - lambda - lgamma(k+1)))
}

n <- 6
p <- (51/100)
expected <- n * p
outcomes <- 0:n

df <- data.frame(x = outcomes)
df$y <- dpois(outcomes, expected)
df$y_custom <- pmf(outcomes, expected)
df$the_diff <- df$y - df$y_custom

print(all.equal(df$y, df$y_custom, tolerance=1e-3))
print(df)