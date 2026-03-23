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

for (t in 2:n1) {
  y[t] <- 0.2 * y[t-1]+e[t]
}

# Now, I will create the first point after the break (n1)
# meaning a second AR with stronger dependence post n1.
# This part is relatively simple
y[n1 + 1] <- 0.85 * y[n1] + e[n1 + 1]


# generating all other points after the break generated above (full second stronger dependence AR)
for (t in (n1 + 2):n) {
  y[t] <- 0.85*y[t-1] + e[t]
}



# Time to convert a simulated vector into time-series object -> Then plot it with the break point
ts_y <-ts(y)

plot(ts_y, main = "Simulated series with changing AR structure (change occurs at point 118)")
abline(v = n1, lty = 2)



# Next I am rewriting the data row in a regression form to run the algo:

x_ar1 <- cbind(
  ts_y[-1], # I start from -1 as for the AR1 each value must have the previous value. So, we can't start with the first value as it does not have anything that comes before it.
  rep(1, length(ts_y) - 1),
  ts_y[-length(ts_y)] # done for the lagged values
)

# Running a EnvCpt's internal regression change point function on previously AR1 formatted data
fit_ar1 <- EnvCpt:::cpt.reg(
  x_ar1,
  method = "PELT",
  minseglen = 5
)


# Estimating the breaking point
cpts(fit_ar1)
plot(fit_ar1, main = "AR1 changepoint (red line is a fitted value)")


# as we see, our model estimated the breaking pint at 119, it is good as we know that in reality it was 118!
