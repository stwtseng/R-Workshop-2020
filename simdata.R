# Simulate dependent variables

# set.seed(19836)
autonomy <- rnorm(n = 500, mean = 3.9, sd = 1.15)
# hist(autonomy)
sum(autonomy > 7)
autonomy[autonomy > 7] <- 7
sum(autonomy < 1)
autonomy[autonomy < 1] <- 1
hist(autonomy, breaks = c(.5:7.5))

# set.seed(19830)
wealth <- rnorm(n = 500, mean = 3.2, sd = 1.3)
# hist(wealth)
sum(wealth > 7)
wealth[wealth > 7] <- 7
sum(wealth < 1)
wealth[wealth < 1] <- 1
hist(wealth, breaks = c(.5:7.5))

# set.seed(19835)
corruption <- rnorm(n = 500, mean = 4.1, sd = 1.1)
# hist(corruption)
sum(corruption > 7)
sum(corruption < 1)
corruption[corruption < 1] <-  1
hist(corruption, breaks = c(.5:7.5))

# Categorical variable outlook (pessimistic vs optimistic)
outlook <- rep(c(0, 1), 250)

# Simulate outcome variable from regression formula
# set.seed(19850)
happiness <- 2.325 + .35*autonomy + .32*wealth + -.22*corruption + .15*outlook + .3*(corruption*outlook) + rnorm(100, 0, 1)
# hist(happiness)
sum(happiness > 7)
happiness[happiness > 7] <- 7
sum(happiness < 1)
happiness[happiness < 1] <- 1
hist(happiness, breaks = c(.5:7.5))

# Generate data frame
dat <- data.frame(happiness, autonomy, wealth, corruption, outlook)

# Convert outlook to factor
dat$outlook <- ifelse(dat$outlook == 1, "optimistic", "pessimistic")
dat$outlook <- factor(dat$outlook, levels = c("pessimistic", "optimistic"))

# Shuffle Rows
dat <- dat[sample(nrow(dat)),]

# Create id variable
dat$id <- seq.int(1, 500)
dat <- dat[, c(6, 1:5)] # reorder

# Write out file
write.csv(dat, file = "./Workshop 2020 Datasets/happinessdata.csv", row.names = FALSE)
