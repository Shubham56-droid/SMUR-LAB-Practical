# Step 1: Importing the Dataset
# The 'mtcars' dataset is built into R, so there's no need to import it
data(mtcars)

# Step 2: Exploring the Dataset
# Check the structure of the 'mtcars' dataset
str(mtcars)

# Preview the first 6 rows
head(mtcars)

# Get a summary of basic statistics for all columns
summary(mtcars)

# Step 3: Basic Data Manipulations
# Subset the data for cars with horsepower (hp) greater than 150
subset_hp <- mtcars[mtcars$hp > 150, ]

# Create a new column that shows the power-to-weight ratio
mtcars$power_to_weight <- mtcars$hp / mtcars$wt

# Filter the data for cars with automatic transmissions (am == 0)
auto_cars <- subset(mtcars, am == 0)

# Step 4: Descriptive Statistics
# Calculate mean, median, and standard deviation for 'mpg' (miles per gallon)
mean_mpg <- mean(mtcars$mpg)
median_mpg <- median(mtcars$mpg)
sd_mpg <- sd(mtcars$mpg)

# Create a frequency table for 'cyl' (number of cylinders)
cyl_freq <- table(mtcars$cyl)

# Step 5: Visualization
# Plot a histogram of 'mpg'
hist(mtcars$mpg, main = "Histogram of MPG", xlab = "Miles per Gallon")

# Plot a bar graph for 'cyl'
barplot(cyl_freq, main = "Bar Plot of Cylinder Count", xlab = "Number of Cylinders")

# Create a scatter plot of 'hp' (horsepower) vs 'mpg' (miles per gallon)
plot(
  mtcars$hp,
  mtcars$mpg,
  main = "Scatter Plot of Horsepower vs Miles per Gallon",
  xlab = "Horsepower",
  ylab = "Miles per Gallon",
  pch = 16,  # use filled circles as points
  col = "blue"  # set the color of the points
)

# Step 6: Analysis and Interpretation
# Display calculated statistics for 'mpg'
cat("Mean MPG:", mean_mpg, "\n")
cat("Median MPG:", median_mpg, "\n")
cat("Standard Deviation of MPG:", sd_mpg, "\n")

# Display the frequency table for 'cyl'
print(cyl_freq)

# Interpretation of findings
# Discuss the relationship between horsepower and miles per gallon based on the scatter plot.
# For example, higher horsepower might lead to lower fuel efficiency, which could be a pattern in the scatter plot.

