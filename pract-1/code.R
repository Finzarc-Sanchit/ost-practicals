# ==========================================================
# PRACTICAL NO. 1
# AIM: Setting up Working Directory & Basic Calculations in R
# Language / Tool: R Programming | RStudio
# ==========================================================

# ==========================================================
# Program 1a — Working Directory Operations
# ==========================================================

# Experiment 1a: Setting up Working Directory in R

# Check current working directory
getwd()

# Set a new working directory
setwd("C:/Users/Student/R_Practicals")

# Verify the change
getwd()

# List all files in the working directory
list.files()

# List files with full path
list.files(full.names = TRUE)

# Display current working directory path
cat("Working Directory: ", getwd(), "\n")


# ==========================================================
# Program 1b — Basic Arithmetic Operations
# ==========================================================

# Experiment 1b: Basic Arithmetic Operations in R

a <- 25
b <- 7

cat("--- Arithmetic Operations ---\n")
cat("a =", a, " b =", b, "\n")

cat("Addition       : a + b =", a + b, "\n")
cat("Subtraction    : a - b =", a - b, "\n")
cat("Multiplication : a * b =", a * b, "\n")
cat("Division       : a / b =", a / b, "\n")
cat("Integer Div    : a %/% b =", a %/% b, "\n")
cat("Modulus        : a %% b =", a %% b, "\n")
cat("Exponent       : a ^ 2 =", a ^ 2, "\n")

# Square root and absolute value
cat("Square Root    : sqrt(a) =", sqrt(a), "\n")
cat("Absolute Value : abs(-a) =", abs(-a), "\n")

# Rounding functions
x <- 3.7856
cat("Round 2 dec    : round(x,2) =", round(x, 2), "\n")
cat("Floor          : floor(x) =", floor(x), "\n")
cat("Ceiling        : ceiling(x) =", ceiling(x), "\n")


# ==========================================================
# Program 1c — Comparison and Logical Operators
# ==========================================================

# Experiment 1c: Comparison and Logical Operators

p <- 15
q <- 9

cat("--- Comparison Operators ---\n")

cat("p > q :", p > q, "\n")
cat("p < q :", p < q, "\n")
cat("p == q :", p == q, "\n")
cat("p != q :", p != q, "\n")
cat("p >= q :", p >= q, "\n")
cat("p <= q :", p <= q, "\n")

cat("\n--- Logical Operators ---\n")

m <- TRUE
n <- FALSE

cat("m AND n : m & n =", m & n, "\n")
cat("m OR n  : m | n =", m | n, "\n")
cat("NOT m   : !m    =", !m, "\n")
cat("NOT n   : !n    =", !n, "\n")


# ==========================================================
# Program 1d — Variables and Data Types
# ==========================================================

# Experiment 1d: Variables and Data Types

# Numeric
num_val <- 98.6
cat("Numeric Value :", num_val, "| Class:", class(num_val), "\n")

# Integer
int_val <- 42L
cat("Integer Value :", int_val, "| Class:", class(int_val), "\n")

# Character
str_val <- "YCCE Nagpur"
cat("String Value  :", str_val, "| Class:", class(str_val), "\n")

# Logical
bool_val <- TRUE
cat("Logical Value :", bool_val, "| Class:", class(bool_val), "\n")

# Complex
cplx_val <- 3 + 4i
cat("Complex Value :", as.character(cplx_val),
    "| Class:", class(cplx_val), "\n")

# Type checking
cat("\n--- Type Checks ---\n")
cat("is.numeric(num_val) :", is.numeric(num_val), "\n")
cat("is.integer(int_val) :", is.integer(int_val), "\n")
cat("is.character(str_val):", is.character(str_val), "\n")
cat("is.logical(bool_val) :", is.logical(bool_val), "\n")


# ==========================================================
# Program 1e — Built-in Mathematical Functions
# ==========================================================

# Experiment 1e: Built-in Mathematical Functions

vals <- c(4, 9, 16, 25, 36)

cat("--- Math Functions on Vector ---\n")

cat("Values   :", vals, "\n")
cat("Sum      :", sum(vals), "\n")
cat("Mean     :", mean(vals), "\n")
cat("Median   :", median(vals), "\n")
cat("Variance :", var(vals), "\n")
cat("Std Dev  :", sd(vals), "\n")
cat("Min      :", min(vals), "\n")
cat("Max      :", max(vals), "\n")
cat("Range    :", range(vals), "\n")
cat("Sqrt each:", sqrt(vals), "\n")

# Logarithm and exponential
cat("\n--- Log & Exp ---\n")
cat("log(100)   :", log(100), "\n")
cat("log10(100) :", log10(100), "\n")
cat("log2(8)    :", log2(8), "\n")
cat("exp(1)     :", exp(1), "\n")

# Trigonometric functions (in radians)
cat("\n--- Trigonometry ---\n")
cat("sin(pi/2) :", sin(pi/2), "\n")
cat("cos(pi)   :", cos(pi), "\n")
cat("tan(pi/4) :", tan(pi/4), "\n")