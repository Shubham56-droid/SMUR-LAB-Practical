# Load necessary libraries
library(tidyverse)
library(ggplot2)

# Scenario 1: t-test for comparing means with visualization
group1 <- c(25, 30, 28, 35, 32)
group2 <- c(20, 22, 18, 25, 28)

# Perform the t-test
t_test_result <- t.test(group1, group2)

# Boxplot for the two groups
data_ttest <- data.frame(
  group = rep(c("Group 1", "Group 2"), each = 5),
  value = c(group1, group2)
)

ggplot(data_ttest, aes(x = group, y = value, fill = group)) +
  geom_boxplot() +
  labs(title = "Boxplot of Group 1 and Group 2", x = "Group", y = "Value") +
  theme_minimal()

# Scenario 2: Z-test for proportions with visualization
successes <- 20
total_trials <- 50
expected_proportion <- 0.5  # Example expected proportion

# Perform the Z-test
prop_test_result <- prop.test(successes, total_trials, p = expected_proportion, alternative = "two.sided")

# Bar plot for proportion of successes
data_ztest <- data.frame(
  category = c("Successes", "Failures"),
  count = c(successes, total_trials - successes)
)

ggplot(data_ztest, aes(x = category, y = count, fill = category)) +
  geom_bar(stat = "identity") +
  labs(title = "Proportion of Successes and Failures", x = "Category", y = "Count") +
  theme_minimal()

# Scenario 3: Chi-Square test for independence with visualization
data <- matrix(c(30, 20, 15, 25), nrow = 2, byrow = TRUE)
rownames(data) <- c("Row 1", "Row 2")
colnames(data) <- c("Column 1", "Column 2")

# Perform the Chi-Square test
chi_square_result <- chisq.test(data)

# Corrected data frame for heatmap
data_chi <- as.data.frame(as.table(data))  # Convert matrix to data frame

ggplot(data_chi, aes(x = Var1, y = Var2, fill = Freq)) +
  geom_tile() +
  labs(title = "Contingency Table Heatmap", x = "Row", y = "Column") +
  theme_minimal()

# Print results for the hypothesis tests
print("t-Test Result:")
print(t_test_result)

print("Z-Test Result:")
print(prop_test_result)

print("Chi-Square Test Result:")
print(chi_square_result)
