library(Rcpp)
# look at documentation for install Rcpp

cppFunction("double c_pmf(double k, double lambda) {
  return pow(M_E, k * log(lambda) - lambda - lgamma(k + 1.0));
}")

n <- 6
p <- 51/100
expected <- n * p
outcomes <- 0:n

# call cpp scalar version
print("Probability of 6 of 6 (rcpp function):")
print(c_pmf(n, expected))

#benchmark
?benchmark

pmf <- function(k, lambda) {
  return(exp(k * log(lambda) - lambda - lgamma(k+1)))
}

results = list(
  base_r = benchmark(yr <- dpois(n, expected), replications = 1000)$elapsed,
  custom_r = benchmark(yr <- pmf(n, expected), replications = 1000)$elapsed,
  custom_cpp = benchmark(yc <- c_pmf(n, expected), replications = 1000)$elapsed
)

print(results)