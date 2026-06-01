# ==========================================================
# PRACTICAL NO. 7
# AIM:
# Write an R program on several built-in math functions
# on mtcars dataset.
# ==========================================================

# Load mtcars dataset
data(mtcars)

# Display the first few rows
print("First few rows of mtcars:")
print(head(mtcars))

# Select one variable - mpg (miles per gallon)
mpg_data <- mtcars$mpg

# Display the selected variable
print("Selected variable: mpg")
print(mpg_data)

# Statistical functions on mpg

mean_mpg <- mean(mpg_data)

median_mpg <- median(mpg_data)

mode_mpg <- as.numeric(
  names(sort(table(mpg_data), decreasing = TRUE)[1])
)   # Mode

sd_mpg <- sd(mpg_data)

var_mpg <- var(mpg_data)

min_mpg <- min(mpg_data)

max_mpg <- max(mpg_data)

range_mpg <- range(mpg_data)

quantiles_mpg <- quantile(mpg_data)

summary_mpg <- summary(mpg_data)

# Display results

cat("\nStatistical Summary of mpg:\n")

cat("Mean:", mean_mpg, "\n")

cat("Median:", median_mpg, "\n")

cat("Mode:", mode_mpg, "\n")

cat("Standard Deviation:", sd_mpg, "\n")

cat("Variance:", var_mpg, "\n")

cat("Minimum:", min_mpg, "\n")

cat("Maximum:", max_mpg, "\n")

cat("Range:", range_mpg[1], "to", range_mpg[2], "\n")

cat("Quantiles:\n")

print(quantiles_mpg)

cat("Summary:\n")

print(summary_mpg)