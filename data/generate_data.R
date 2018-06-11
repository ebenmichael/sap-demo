suppressMessages(library(dplyr))
suppressMessages(library(magrittr))

set.seed(12345)
# Generate fake data for the demo
n <- 5000
data <- data.frame(list(gender=sample(c(0,1), n, replace=TRUE)))
data$age <- rnorm(n, mean=40, sd=10)
data$cigsperday <- rpois(n, 20)
data$timefromwaking <- rpois(n, 40)
# intention to quit
data$intquit <- sample(4, n, replace=TRUE)
# determination to quit
data$determquit <- sample(5, n, replace=TRUE)
# live with smokers
data$livesmoke <- sample(c(0,1), n, replace=TRUE)
# deprevation
data$imd <- rnorm(n, mean=2000, sd=100)
# previous NHS SSS attendance
data$prev <- sample(c(0,1), n, replace=TRUE)

# treatment assignment
n_t <- floor(3/5 * n)
data$treated <- c(rep(1, n_t), rep(0, n-n_t))

# entering the service
data$enter <- sample(c(0,1), n, replace=TRUE)


# save the data
write.csv(data, "synthetic_data.csv")
