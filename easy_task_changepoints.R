library(changepoint)
library(EnvCpt)
set.seed(2118) # As it is my favourite number

# Now, I will set the amount of observations we want to generate
# for each fo the 2 regimes

n1 <- 118
n2 <- 118
n <- n1 + n2

# next I will create just a random noise variable and an empty vector of the
#total size n
e <- rnorm(n)

y <- numeric(n)

#generating the first regime. Current value depends on the previous yet not strongly
# (only 0.2 of the previous value carries into the next one)

for (t in 2:in1) {
  y[t] <- 0.2 * y[t-1]+e[t]
}
