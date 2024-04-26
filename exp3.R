# Step 1: Theoretical Probabilities
# For a fair six-sided die, the theoretical probability for each outcome is 1/6.
theoretical_probabilities <- rep(1/6, 6)

# Step 2: Random Number Generation
# Generate 1000 random outcomes from a fair six-sided die
set.seed(42)  # Set seed for reproducibility
simulated_rolls <- sample(1:6, size = 1000, replace = TRUE)

# Step 3: Simulations
# Calculate the empirical probabilities from the simulated data
empirical_probabilities <- table(simulated_rolls) / length(simulated_rolls)

# Step 4: Visualization
# Plot theoretical probabilities
barplot(theoretical_probabilities, names.arg = 1:6, ylim = c(0, 0.25), col = "blue", 
        main = "Theoretical Probabilities", xlab = "Outcome", ylab = "Probability")

# Plot empirical probabilities
barplot(empirical_probabilities, names.arg = 1:6, ylim = c(0, 0.25), col = "red", 
        main = "Empirical Probabilities", xlab = "Outcome", ylab = "Probability")

# Step 5: Analysis
# You can use summary statistics to compare theoretical and empirical probabilities
print("Empirical Probabilities:")
print(empirical_probabilities)

# Calculate discrepancies between theoretical and empirical probabilities
discrepancies <- theoretical_probabilities - empirical_probabilities
print("Discrepancies:")
print(discrepancies)

# Step 6: Conclusion
# A basic conclusion could be made as follows:
if (all(abs(discrepancies) < 0.05)) {
  message("Empirical probabilities are in line with theoretical probabilities.")
} else {
  message("Empirical probabilities deviate significantly from theoretical probabilities. Consider a larger sample size.")
}

# Additional analysis: Plot discrepancies to visualize deviations
barplot(discrepancies, names.arg = 1:6, col = "purple", 
        main = "Discrepancies between Theoretical and Empirical Probabilities", 
        xlab = "Outcome", ylab = "Discrepancy")
