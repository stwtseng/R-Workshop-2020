# Read in Data
dat <- read.csv("./Workshop 2020 Datasets/happinessdata.csv", header = TRUE, sep = ",")

# Examine Data
nrow(dat)
colnames(dat)
head(dat)
tail(dat)
sum(is.na(dat))

# Quick Descriptive Statistics and Histograms on Variables
min(dat$happiness)
max(dat$happiness)
mean(dat$happiness)
sd(dat$happiness)
hist(dat$happiness)
hist(dat$happiness, breaks = c(.5:7.5))
# Repeat for other variables

# Quick Boxplots
boxplot(dat$happiness)
# Repeat for other variables

# Quick Barplot
barplot(table(dat$outlook))

# Quick Piechart
pie(c(sum(dat$outlook == "optimistic"), sum(dat$outlook == "pessimistic")),
    labels = c("optimistic", "pessimistic"))

# Quick Scatterplots
plot(dat$autonomy, dat$happiness)
abline(lm(happiness ~ autonomy, data = dat))
# Repeat for other variables

cor(dat$autonomy, dat$happiness)
cor.test(dat$autonomy, dat$happiness)

# Quick Scatterplot Matrix
plot(dat[, 2:5])

#######################################################################################

# Load Library
library(tidyverse)

# Nicer Histograms
ggplot(data = dat, aes(x = happiness)) # Create foundational layer

ggplot(data = dat, aes(x = happiness)) + geom_histogram() # Add geom

ggplot(data = dat, aes(x = happiness)) + geom_histogram(binwidth = 1) # Refine geom detail

ggplot(data = dat, aes(x = happiness)) + 
  geom_histogram(binwidth = 1, color = "blue", fill = "white") # Further refine

ggplot(data = dat, aes(x = happiness)) + 
  geom_histogram(binwidth = 1, color = "blue", fill = "white") +
  scale_x_continuous(breaks = c(1:7)) # Adjust axes
  
ggplot(data = dat, aes(x = happiness)) + 
  geom_histogram(binwidth = 1, color = "blue", fill = "white") +
  scale_x_continuous(breaks = c(1:7)) +
  xlab("Happiness") + ylab("Frequency") # Alter axes titles

ggplot(data = dat, aes(x = happiness)) + 
  geom_histogram(binwidth = 1, color = "blue", fill = "white") +
  scale_x_continuous(breaks = c(1:7)) +
  xlab("Happiness") + ylab("Frequency") +
  ggtitle("Histogram of Happiness Ratings") # Add plot title

ggplot(data = dat, aes(x = happiness)) + 
  geom_histogram(binwidth = 1, color = "blue", fill = "white") +
  scale_x_continuous(breaks = c(1:7)) +
  labs(x = "Happiness", y = "Frequency", title = "Histogram of Happiness Ratings")

ggplot(data = dat, aes(x = happiness)) + 
  geom_histogram(binwidth = 1, color = "blue", fill = "white") +
  scale_x_continuous(breaks = c(1:7)) +
  labs(x = "Happiness", y = "Frequency", title = "Histogram of Happiness Ratings") +
  theme_bw() # Alter theme

ggplot(data = dat, aes(x = happiness)) + 
  geom_histogram(binwidth = 1, color = "black", fill = "gray") +
  scale_x_continuous(breaks = c(1:7)) +
  labs(x = "Happiness", y = "Frequency", title = "Histogram of Happiness Ratings") +
  theme_classic() # Another theme

# Challenge: Add vertical line showing the mean
ggplot(data = dat, aes(x = happiness)) + 
  geom_histogram(binwidth = 1, color = "black", fill = "gray") +
  scale_x_continuous(breaks = c(1:7)) +
  geom_vline(xintercept = mean(dat$happiness), color = "red", linetype = "dashed", size = 1) +
  labs(x = "Happiness", y = "Frequency", title = "Histogram of Happiness Ratings") +
  theme_classic()

# Challenge: Overlay normal distribution
# Hint: Use density instead of frequency
ggplot(data = dat, aes(x = happiness)) + 
  geom_histogram(aes(y = ..density..), binwidth = 1, color = "black", fill = "gray") +
  stat_function(fun = dnorm, args = list(mean = mean(dat$happiness), sd = sd(dat$happiness))) +
  scale_x_continuous(breaks = c(1:7)) +
  geom_vline(xintercept = mean(dat$happiness), color = "red", linetype = "dashed", size = 1) +
  labs(x = "Happiness", y = "Frequency", title = "Histogram of Happiness Ratings") +
  theme_classic()

# Repeat for other variables

# Set Theme to Save Time
theme_set(theme_classic())

# Bar Graphs
ggplot(data = dat, aes(y = happiness, x = outlook)) + 
  geom_bar() # Error

?geom_bar()
  
ggplot(data = dat, aes(y = happiness, x = outlook)) + 
  geom_bar(stat = "summary", fun.y = "mean") # Specify mean

ggplot(data = dat, aes(y = happiness, x = outlook)) + 
  geom_bar(stat = "summary", fun.y = "mean", aes(fill = outlook)) # Add color

ggplot(data = dat, aes(y = happiness, x = outlook)) + 
  geom_bar(stat = "summary", fun.y = "mean", aes(fill = outlook)) +
  scale_y_continuous(limits = c(0, 7), breaks = c(1:7)) # Alter y-axis

ggplot(data = dat, aes(y = happiness, x = outlook)) + 
  geom_bar(stat = "summary", fun.y = "mean", aes(fill = outlook)) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 7), breaks = c(1:7)) # Remove space

ggplot(data = dat, aes(y = happiness, x = outlook)) + 
  geom_bar(stat = "summary", fun.y = "mean", aes(fill = outlook), width = .5) + # Size
  scale_y_continuous(expand = c(0, 0), limits = c(0, 7), breaks = c(1:7)) 

ggplot(data = dat, aes(y = happiness, x = outlook)) + 
  geom_bar(stat = "summary", fun.y = "mean", aes(fill = outlook), width = .5) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 7), breaks = c(1:7)) +
  labs(x = "Outlook on Life", y = "Happiness", 
       title = "Mean Differences in Happiness Ratings by Outlook on Life") # Alter labels
  
ggplot(data = dat, aes(y = happiness, x = outlook)) + 
  geom_bar(stat = "summary", fun.y = "mean", aes(fill = outlook), width = .5) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 7), breaks = c(1:7)) +
  scale_x_discrete(labels = c("Optimistic", "Pessimistic")) + # Adjust category labels
  labs(x = "Outlook on Life", y = "Happiness", 
       title = "Mean Differences in Happiness Ratings by Outlook on Life")

# Challenge: Remove Unnecessary Legend
ggplot(data = dat, aes(y = happiness, x = outlook)) + 
  geom_bar(stat = "summary", fun.y = "mean", aes(fill = outlook), width = .5) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 7), breaks = c(1:7)) +
  scale_x_discrete(labels = c("Optimistic", "Pessimistic")) +
  labs(x = "Outlook on Life", y = "Happiness", 
       title = "Mean Differences in Happiness Ratings by Outlook on Life") +
  guides(fill = FALSE)

# Challenge: Add Error Bars Showing Confidence Intervals
ggplot(data = dat, aes(y = happiness, x = outlook)) + 
  geom_bar(stat = "summary", fun.y = "mean", aes(fill = outlook), width = .3) +
  stat_summary(geom = "errorbar", fun.data = mean_cl_normal, width = .05) + 
  scale_y_continuous(expand = c(0, 0), limits = c(0, 7), breaks = c(1:7)) +
  scale_x_discrete(labels = c("Optimistic", "Pessimistic")) +
  labs(x = "Outlook on Life", y = "Happiness", 
       title = "Mean Differences in Happiness Ratings by Outlook on Life") +
  guides(fill = FALSE)

# Challenge: Change Color for Black-White Publishing
ggplot(data = dat, aes(y = happiness, x = outlook)) + 
  geom_bar(stat = "summary", fun.y = "mean", aes(fill = outlook), width = .3) +
  stat_summary(geom = "errorbar", fun.data = mean_cl_normal, width = .05) +
  scale_fill_manual(values = c("grey30", "grey60")) +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 7), breaks = c(1:7)) +
  scale_x_discrete(labels = c("Optimistic", "Pessimistic")) +
  labs(x = "Outlook on Life", y = "Happiness", 
       title = "Mean Differences in Happiness Ratings by Outlook on Life") +
  guides(fill = FALSE)

# Scatterplots

## Wealth and Happiness
ggplot(data = dat, aes(x = wealth, y = happiness))

ggplot(data = dat, aes(x = wealth, y = happiness)) + geom_point()

ggplot(data = dat, aes(x = wealth, y = happiness)) + geom_point() + geom_line() # woops!

ggplot(data = dat, aes(x = wealth, y = happiness)) + geom_point() + geom_smooth() # Note: Using method "loess"

ggplot(data = dat, aes(x = wealth, y = happiness)) + 
  geom_point() + geom_smooth(method = "lm") # Linear model

ggplot(data = dat, aes(x = wealth, y = happiness)) + 
  geom_point(size = .9) + geom_smooth(method = "lm") + # Customize size
  scale_y_continuous(limits = c(1, 7), breaks = c(1:7)) + # Customize y-axis
  scale_x_continuous(limits = c(1, 7), breaks = c(1:7)) + # Customize x-axis
  labs(x = "Wealth", y = "Happiness") # Customize labels

## Autonomy and Happiness
ggplot(data = dat, aes(x = autonomy, y = happiness)) + 
  geom_point(size = .9) + # Typically don't add line 
  scale_y_continuous(limits = c(1, 7), breaks = c(1:7)) +
  scale_x_continuous(limits = c(1, 7), breaks = c(1:7)) +
  labs(x = "Autonomy", y = "Happiness")

## Corruption and Happiness
ggplot(data = dat, aes(x = corruption, y = happiness)) + 
  geom_point(size = .9) + 
  scale_y_continuous(limits = c(1, 7), breaks = c(1:7)) +
  scale_x_continuous(limits = c(1, 7), breaks = c(1:7)) +
  labs(x = "Corruption", y = "Happiness")

ggplot(data = dat, aes(x = corruption, y = happiness)) + 
  geom_point(size = .9) + geom_smooth(method = "lm") + # Add line to visualize
  scale_y_continuous(limits = c(1, 7), breaks = c(1:7)) +
  scale_x_continuous(limits = c(1, 7), breaks = c(1:7)) +
  labs(x = "Corruption", y = "Happiness")

## Visualize Scatterplot by Category
ggplot(data = dat, aes(x = corruption, y = happiness, color = outlook)) + 
  geom_point(size = .9) + 
  scale_y_continuous(limits = c(1, 7), breaks = c(1:7)) +
  scale_x_continuous(limits = c(1, 7), breaks = c(1:7)) +
  labs(x = "Corruption", y = "Happiness")


## Add line
ggplot(data = dat, aes(x = corruption, y = happiness, color = outlook)) + 
  geom_point(size = .9) + geom_smooth(method = "lm", se = FALSE) + # Remove SE if distracting
  scale_y_continuous(limits = c(1, 7), breaks = c(1:7)) +
  scale_x_continuous(limits = c(1, 7), breaks = c(1:7)) +
  labs(x = "Corruption", y = "Happiness")

# Challenge: Customize Legend
ggplot(data = dat, aes(x = corruption, y = happiness, color = outlook)) + 
  geom_point(size = .9) + geom_smooth(method = "lm", se = FALSE) + 
  scale_y_continuous(limits = c(1, 7), breaks = c(1:7)) +
  scale_x_continuous(limits = c(1, 7), breaks = c(1:7)) +
  labs(x = "Corruption", y = "Happiness") +
  scale_color_discrete(name = "Outlook on Life", labels = c("Optimistic", "Pessimistic"))

# Challenge: Change Linetype
ggplot(data = dat, aes(x = corruption, y = happiness, color = outlook, linetype = outlook)) + 
  geom_point(size = .9) + geom_smooth(method = "lm", se = FALSE) + 
  scale_y_continuous(limits = c(1, 7), breaks = c(1:7)) +
  scale_x_continuous(limits = c(1, 7), breaks = c(1:7)) +
  labs(x = "Corruption", y = "Happiness") +
  scale_linetype_discrete(name = "Outlook on Life", labels = c("Optimistic", "Pessimistic")) + 
  scale_color_discrete(name = "Outlook on Life", labels = c("Optimistic", "Pessimistic"))

# Challenge: Adjust Legend Width
ggplot(data = dat, aes(x = corruption, y = happiness, color = outlook, linetype = outlook)) + 
  geom_point(size = .9) + geom_smooth(method = "lm", se = FALSE) + 
  scale_y_continuous(limits = c(1, 7), breaks = c(1:7)) +
  scale_x_continuous(limits = c(1, 7), breaks = c(1:7)) +
  labs(x = "Corruption", y = "Happiness") +
  scale_linetype_discrete(name = "Outlook on Life", labels = c("Optimistic", "Pessimistic")) + 
  scale_color_discrete(name = "Outlook on Life", labels = c("Optimistic", "Pessimistic")) +
  theme(legend.key.width = unit(1, "cm"))

# Challenge: Make Interaction Graph for Publishing
ggplot(data = dat, aes(x = corruption, y = happiness, linetype = outlook)) + 
  geom_smooth(method = "lm", se = FALSE, color = "black", fullrange = TRUE) + 
  scale_y_continuous(limits = c(1, 7), breaks = c(1:7)) +
  scale_x_continuous(limits = c(1, 7), breaks = c(1:7)) +
  labs(x = "Corruption", y = "Happiness") +
  scale_linetype_discrete(name = "Outlook on Life", labels = c("Optimistic", "Pessimistic")) + 
  theme(legend.key.width = unit(1, "cm"))

# Save graphs with the ggsave function
# Need to first store graph as an object
?ggsave()

