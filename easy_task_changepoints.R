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

# i will be back after my Macro 4 class
