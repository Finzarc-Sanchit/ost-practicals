# ==========================================================
# PRACTICAL NO. 3
# AIM:
# Import/Export on Text File and CSV File;
# Loop Operations (for, while, repeat) in R
# ==========================================================

# ==========================================================
# Program 1a: Create Student Data Frame and Export to TXT
# ==========================================================

student_data <- data.frame(
  RollNo = c(101, 102, 103, 104, 105, 106),
  Name = c("Student1", "Student2", "Student3",
           "Student4", "Student5", "Student6"),
  Age = c(21, 22, 20, 23, 21, 22),
  Marks = c(88, 76, 92, 65, 81, 57),
  Grade = c("A", "B", "A", "C", "B", "D"),
  City = c("Nagpur", "Mumbai", "Pune",
           "Nagpur", "Delhi", "Aurangabad")
)

cat("--- Student Dataset ---\n")
print(student_data)

write.table(
  student_data,
  file = "students.txt",
  sep = "\t",
  row.names = FALSE,
  quote = FALSE
)

cat("\nExported to students.txt\n")


# ==========================================================
# Program 1b: Import from TXT and Perform Field Operations
# ==========================================================

imported_txt <- read.table(
  "students.txt",
  header = TRUE,
  sep = "\t"
)

cat("\n--- Imported from students.txt ---\n")
print(imported_txt)

cat("\n--- Field Operations ---\n")
cat("Total Students :", nrow(imported_txt), "\n")
cat("Average Marks  :", mean(imported_txt$Marks), "\n")
cat("Highest Marks  :", max(imported_txt$Marks), "\n")
cat("Lowest Marks   :", min(imported_txt$Marks), "\n")

cat("\n--- Students with Marks >= 80 ---\n")
print(imported_txt[imported_txt$Marks >= 80, ])

cat("\n--- Students from Nagpur ---\n")
print(imported_txt[imported_txt$City == "Nagpur", ])


# ==========================================================
# Program 1c: Export Student Data to CSV
# ==========================================================

write.csv(
  student_data,
  file = "students.csv",
  row.names = FALSE
)

cat("\nExported to students.csv successfully.\n")

cat("\n--- CSV File Preview ---\n")
cat(readLines("students.csv"), sep = "\n")


# ==========================================================
# Program 1d: Import from CSV and Perform Analysis
# ==========================================================

imported_csv <- read.csv("students.csv")

cat("\n--- Imported from students.csv ---\n")
str(imported_csv)
print(imported_csv)

cat("\n--- Summary: Age and Marks ---\n")
print(summary(imported_csv[, c("Age", "Marks")]))

cat("\n--- Grade-wise Student Count ---\n")
print(table(imported_csv$Grade))

grade_A <- imported_csv[imported_csv$Grade == "A", ]
write.csv(
  grade_A,
  file = "grade_A_students.csv",
  row.names = FALSE
)

cat("\nGrade A students exported to grade_A_students.csv\n")


# ==========================================================
# Program 2a: FOR Loop Demonstrations
# ==========================================================

cat("\n================ FOR LOOP =================\n")

# Basic for loop
cat("\n--- for loop: 1 to 5 ---\n")
for(i in 1:5) {
  cat("Iteration:", i, "\n")
}

# Character vector iteration
cat("\n--- Student Names ---\n")
names_vec <- c("Student1", "Student2", "Student3",
               "Student4", "Student5", "Student6")

for(name in names_vec) {
  cat("Student:", name, "\n")
}

# Sum of marks
cat("\n--- Sum of Marks ---\n")
marks <- c(88, 76, 92, 65, 81, 57)

total <- 0
for(m in marks) {
  total <- total + m
}

cat("Total Marks:", total, "\n")
cat("Average:", total / length(marks), "\n")

# next and break
cat("\n--- Odd Numbers, stop at 7 ---\n")
for(i in 1:10) {
  if(i %% 2 == 0)
    next

  if(i > 7)
    break

  cat("Odd:", i, "\n")
}

# Grade Classification
cat("\n--- Grade Classification ---\n")

for(i in 1:length(marks)) {

  grade <- ifelse(marks[i] >= 90, "A+",
           ifelse(marks[i] >= 80, "A",
           ifelse(marks[i] >= 70, "B", "C")))

  cat(names_vec[i], ":", marks[i],
      "-> Grade:", grade, "\n")
}


# ==========================================================
# Program 2b: WHILE Loop Demonstrations
# ==========================================================

cat("\n================ WHILE LOOP =================\n")

# Countdown
cat("\n--- Countdown ---\n")
count <- 5

while(count > 0) {
  cat("Count:", count, "\n")
  count <- count - 1
}

cat("Countdown complete!\n")

# Running total
cat("\n--- Running Total ---\n")

marks <- c(88, 76, 92, 65, 81, 57)

total <- 0
idx <- 1

while(total <= 250 && idx <= length(marks)) {

  total <- total + marks[idx]

  cat("Added marks[", idx, "] =",
      marks[idx], "| Total:", total, "\n")

  idx <- idx + 1
}

cat("Stopped. Total =", total, "\n")

# Fibonacci Series
cat("\n--- Fibonacci up to 100 ---\n")

a <- 0
b <- 1

cat(a, b)

while((a + b) <= 100) {

  temp <- a + b
  cat(" ", temp)

  a <- b
  b <- temp
}

cat("\n")

# First topper
cat("\n--- First Topper ---\n")

i <- 1

while(i <= length(marks)) {

  if(marks[i] > 85) {
    cat("First topper:",
        names_vec[i],
        "with",
        marks[i],
        "marks\n")
    break
  }

  i <- i + 1
}


# ==========================================================
# Program 2c: REPEAT Loop Demonstrations
# ==========================================================

cat("\n================ REPEAT LOOP =================\n")

# Print 1 to 5
cat("\n--- repeat loop: 1 to 5 ---\n")

i <- 1

repeat {

  cat("Value:", i, "\n")

  i <- i + 1

  if(i > 5)
    break
}

# Below-average students
cat("\n--- Below Average Students ---\n")

avg <- mean(marks)
cat("Class Average:", avg, "\n")

j <- 1

repeat {

  if(marks[j] < avg) {
    cat("Below Average:",
        names_vec[j],
        "->",
        marks[j], "\n")
  }

  j <- j + 1

  if(j > length(marks))
    break
}

# Sentinel value example
cat("\n--- Sum until 0 ---\n")

inputs <- c(10, 20, 35, 0)

total2 <- 0
k <- 1

repeat {

  val <- inputs[k]

  if(val == 0) {
    cat("Exit. Final Sum:",
        total2, "\n")
    break
  }

  total2 <- total2 + val

  cat("Added:", val,
      "| Running Sum:",
      total2, "\n")

  k <- k + 1
}