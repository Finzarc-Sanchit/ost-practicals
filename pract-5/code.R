# ==========================================================
# PRACTICAL NO. 5
# AIM:
# Write R Programs on User-Defined Functions
# ==========================================================


# ==========================================================
# Problem 5a:
# Function for Measures of Central Tendency and Spread
# ==========================================================

x <- c(2, 4, 10, 11, 5, 7)

# Define the function
stats_summary <- function(x) {

  # Measures of Central Tendency
  mean_val <- mean(x)
  median_val <- median(x)

  # Mode (most frequently occurring value)
  freq_table <- table(x)
  mode_val <- as.numeric(names(which.max(freq_table)))

  # Measures of Spread
  range_val <- range(x)
  var_val <- var(x)
  sd_val <- sd(x)
  iqr_val <- IQR(x)
  min_val <- min(x)
  max_val <- max(x)
  length_val <- length(x)

  # Print Results
  cat("=================================\n")
  cat("     STATISTICAL SUMMARY REPORT\n")
  cat("=================================\n")
  cat("Input Vector :", x, "\n")
  cat("---------------------------------\n")

  cat("CENTRAL TENDENCY\n")
  cat(" Mean     :", mean_val, "\n")
  cat(" Median   :", median_val, "\n")
  cat(" Mode     :", mode_val, "\n")

  cat("---------------------------------\n")
  cat("SPREAD / DISPERSION\n")
  cat(" Min      :", min_val, "\n")
  cat(" Max      :", max_val, "\n")
  cat(" Range    :", range_val, "\n")
  cat(" Variance :", round(var_val, 4), "\n")
  cat(" Std Dev  :", round(sd_val, 4), "\n")
  cat(" IQR      :", iqr_val, "\n")
  cat(" Length   :", length_val, "\n")
  cat("=================================\n")

  # Return list of values
  return(list(
    mean = mean_val,
    median = median_val,
    mode = mode_val,
    variance = var_val,
    sd = sd_val,
    range = range_val,
    IQR = iqr_val
  ))
}

# Call the function
x <- c(2, 4, 10, 11, 5, 7)

cat("Calling stats_summary() with x = c(2, 4, 10, 11, 5, 7)\n\n")

result <- stats_summary(x)


# ==========================================================
# Verify returned list from stats_summary()
# ==========================================================

cat("\n--- Accessing Returned List Values ---\n")

cat("result$mean     :", result$mean, "\n")
cat("result$median   :", result$median, "\n")
cat("result$mode     :", result$mode, "\n")
cat("result$variance :", round(result$variance, 4), "\n")
cat("result$sd       :", round(result$sd, 4), "\n")
cat("result$range    :", result$range, "\n")
cat("result$IQR      :", result$IQR, "\n")

# Visualise using summary()
cat("\n--- Built-in summary() for cross-check ---\n")
print(summary(x))


# ==========================================================
# Problem 5b:
# Function to Perform Area of Circle
# ==========================================================

# Define the function
area_of_circle <- function(radius) {

  # Validate radius
  if(radius <= 0) {
    cat("Error: Radius must be a positive number.\n")
    return(NULL)
  }

  # Compute Area
  area <- pi * radius^2

  # Compute Circumference
  circumference <- 2 * pi * radius

  # Compute Diameter
  diameter <- 2 * radius

  # Display Results
  cat("=================================\n")
  cat("        CIRCLE PROPERTIES\n")
  cat("=================================\n")

  cat(" Radius        :", radius, "units\n")
  cat(" Diameter      :", diameter, "units\n")
  cat(" Area          :", round(area, 4), "sq. units\n")
  cat(" Circumference :", round(circumference, 4), "units\n")
  cat(" Value of pi   :", pi, "\n")

  cat("=================================\n")

  return(list(
    radius = radius,
    diameter = diameter,
    area = area,
    circumference = circumference
  ))
}

# Test Cases

cat("\n--- Test 1: radius = 5 ---\n")
r1 <- area_of_circle(5)

cat("\n--- Test 2: radius = 7.5 ---\n")
r2 <- area_of_circle(7.5)

cat("\n--- Test 3: radius = 1 (unit circle) ---\n")
r3 <- area_of_circle(1)

cat("\n--- Test 4: Invalid radius = -3 ---\n")
area_of_circle(-3)