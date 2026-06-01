# ==========================================================
# PRACTICAL NO. 2
# AIM:
# Write an R program to define and print different types of
# data structures commonly used in R.
# ==========================================================

# ==========================================================
# Basic Data Types
# ==========================================================

# Numeric
num_var <- 3.14
cat("Numeric Value:", num_var, "\n")
cat("Class:", class(num_var), "\n")
cat("Type:", typeof(num_var), "\n\n")

# Integer
int_var <- 42L
cat("Integer Value:", int_var, "\n")
cat("Class:", class(int_var), "\n")
cat("Type:", typeof(int_var), "\n\n")

# Character
char_var <- "Hello R"
cat("Character Value:", char_var, "\n")
cat("Class:", class(char_var), "\n")
cat("Type:", typeof(char_var), "\n\n")

# Logical
log_var <- TRUE
cat("Logical Value:", log_var, "\n")
cat("Class:", class(log_var), "\n")
cat("Type:", typeof(log_var), "\n\n")


# ==========================================================
# Data Structures
# ==========================================================

# Vector (numeric)
num_vector <- c(1, 2, 3, 4, 5)
cat("Numeric Vector:", num_vector, "\n")
cat("Class:", class(num_vector), "\n")
cat("Type:", typeof(num_vector), "\n\n")

# Vector (character)
char_vector <- c("apple", "banana", "cherry")
cat("Character Vector:", char_vector, "\n")
cat("Class:", class(char_vector), "\n")
cat("Type:", typeof(char_vector), "\n\n")

# List (mixed data types)
mixed_list <- list(123, "R programming", TRUE, c(1,2,3))
cat("List:\n")
print(mixed_list)
cat("Class:", class(mixed_list), "\n")
cat("Type:", typeof(mixed_list), "\n\n")

# Matrix
mat <- matrix(1:9, nrow = 3, ncol = 3)
cat("Matrix:\n")
print(mat)
cat("Class:", class(mat), "\n")
cat("Type:", typeof(mat), "\n\n")

# Data Frame
df <- data.frame(
  ID = 1:3,
  Name = c("Alice", "Bob", "Charlie"),
  Score = c(85.5, 90.0, 78.5),
  Passed = c(TRUE, TRUE, FALSE)
)

cat("Data Frame:\n")
print(df)
cat("Class:", class(df), "\n")
cat("Type:", typeof(df), "\n")