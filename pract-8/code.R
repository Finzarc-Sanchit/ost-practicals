# ==========================================================
# PRACTICAL NO. 8
# Aim:
# Write an R program to create a complex number.
#
# Problem Statement:
# 1. Creating a numeric data type
# 2. Creating an integer
# 3. Creating a complex number
# 4. Converting from one type to another
# ==========================================================

# ==========================================================
# 1. Creating a Numeric Data Type
# ==========================================================

numeric_val <- 10.5

cat("Numeric value:", numeric_val, "\n")

cat("Type of numeric_val:",
    typeof(numeric_val),
    "\n\n")


# ==========================================================
# 2. Creating an Integer
# ==========================================================

integer_val <- 20L

cat("Integer value:", integer_val, "\n")

cat("Type of integer_val:",
    typeof(integer_val),
    "\n\n")


# ==========================================================
# 3. Creating a Complex Number
# ==========================================================

complex_val <- 4 + 5i

cat("Complex number:", complex_val, "\n")

cat("Type of complex_val:",
    typeof(complex_val),
    "\n\n")


# ==========================================================
# 4. Converting from One Type to Another
# ==========================================================

# Convert numeric to integer

converted_integer <- as.integer(numeric_val)

cat("Converted numeric to integer:",
    converted_integer,
    "\n")

cat("Type of converted_integer:",
    typeof(converted_integer),
    "\n\n")


# Convert integer to complex

converted_complex <- as.complex(integer_val)

cat("Converted integer to complex:",
    converted_complex,
    "\n")

cat("Type of converted_complex:",
    typeof(converted_complex),
    "\n\n")


# Convert complex to numeric (real part only)

converted_numeric <- as.numeric(complex_val)

cat("Converted complex to numeric (real part):",
    converted_numeric,
    "\n")

cat("Type of converted_numeric:",
    typeof(converted_numeric),
    "\n")

