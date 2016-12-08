source('output.R')

# https://cran.r-project.org/view=Distributions
?dbinom

n <- 6
p <- (51/100)
expected <- n * p
outcomes <- 0:n

yp <- dpois(outcomes, expected)
yp <- yp / sum(yp)  # you could normalize, since p > 6 = 0
dfp <- data.frame(x=outcomes, y=yp, name="Poisson")


yb <- dbinom(x=outcomes, size=n, prob=p)
dfb <- data.frame(x=outcomes, y=yb, name="Binom")

df <- rbind(dfp, dfb)
print(df)
print_prob(tail(dfb$y, n=1))

g <- ggplot(df, aes(x, y, fill=name)) +
  geom_bar(stat="identity", position="dodge") +
  theme_fivethirtyeight()
print(g)
