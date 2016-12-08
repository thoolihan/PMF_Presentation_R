library(ggplot2)
library(ggthemes)

plot_prob <- function(x, y) {
  g <- ggplot(NULL, aes(x, y)) +
    geom_bar(stat="identity") +
    theme_fivethirtyeight()
  print(g)
}

print_prob <- function(p) {
  print(paste("Probability of all girls at the bus stop: ", 
              format(p * 100, digits=4), 
              "%", 
              sep=""))
}

print_plot <- function(x, y) {
  print_prob(tail(y, n=1))
  plot_prob(x, y)
}