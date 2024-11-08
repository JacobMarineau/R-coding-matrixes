a <- 5
b <- 10
sum_ab <- a + b
print(sum_ab)

vec <- seq(1, 100, by = 2)
print(vec)
mean_vec <- mean(vec)
sd_vec <- sd(vec)
cat("Mean:", mean_vec, "Standard Deviation:", sd_vec, "\n")

data <- data.frame(
  Name = c("Alice", "Bob", "Charlie"),
  Age = c(25, 30, 35),
  Score = c(88, 92, 95)
)
print(data)
data$Passed <- data$Score > 90
print(data)

x <- rnorm(100)
y <- rnorm(100)
plot(x, y, main = "Scatter Plot of Random Points", xlab = "X Values", ylab = "Y Values")

if (!require(ggplot2)) install.packages("ggplot2")
library(ggplot2)
ggplot(data, aes(x = Age, y = Score, color = Passed)) +
  geom_point(size = 3) +
  labs(title = "Score by Age", x = "Age", y = "Score")

data("mtcars")
summary(mtcars)
