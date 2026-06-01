# ==========================================================
# PRACTICAL NO. 4
# AIM:
# Perform Loop Control Structure Operations on Text File
# and CSV File in R
# ==========================================================

# ==========================================================
# Part I: Create Student Dataset and Export to TXT & CSV
# ==========================================================

# Step 1: Set working directory
setwd("C:/Users/Student/R_Practicals")

# Step 2: Create student data frame
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

# Step 3: Display data frame
cat("--- Student Dataset ---\n")
print(student_data)

# Step 4: Export to TXT
write.table(
  student_data,
  file = "students.txt",
  sep = "\t",
  row.names = FALSE,
  quote = FALSE
)

cat("\nExported to students.txt\n")

# Step 5: Export to CSV
write.csv(
  student_data,
  file = "students.csv",
  row.names = FALSE
)

cat("Exported to students.csv\n")

# Step 6: Verify files
cat("\nFiles in directory:\n")
cat(list.files(), sep = "\n")


# ==========================================================
# Program 4b: FOR Loop on TXT File
# ==========================================================

txt_data <- read.table(
  "students.txt",
  header = TRUE,
  sep = "\t"
)

cat("\n--- Data from students.txt ---\n")
print(txt_data)

# Print student report
cat("\n--- Student Report (TXT) ---\n")
for(i in 1:nrow(txt_data)) {

  cat("Roll:", txt_data$RollNo[i],
      "| Name:", txt_data$Name[i],
      "| Marks:", txt_data$Marks[i],
      "| Grade:", txt_data$Grade[i], "\n")
}

# Pass / Fail
cat("\n--- Pass/Fail Classification ---\n")
for(i in 1:nrow(txt_data)) {

  result <- ifelse(
    txt_data$Marks[i] >= 60,
    "Pass",
    "Fail"
  )

  cat(txt_data$Name[i], ":", result, "\n")
}

# Total and Average
cat("\n--- Total & Average Marks ---\n")

total <- 0

for(m in txt_data$Marks) {
  total <- total + m
}

cat("Total Marks :", total, "\n")
cat("Average Marks :", total / nrow(txt_data), "\n")


# ==========================================================
# Program 4c: WHILE Loop on TXT File
# ==========================================================

txt_data <- read.table(
  "students.txt",
  header = TRUE,
  sep = "\t"
)

# Print students
cat("\n--- Student List (TXT) ---\n")

i <- 1

while(i <= nrow(txt_data)) {

  cat("[", i, "]",
      txt_data$Name[i],
      "- City:",
      txt_data$City[i], "\n")

  i <- i + 1
}

# First student with marks >= 90
cat("\n--- First Student with Marks >= 90 ---\n")

i <- 1

while(i <= nrow(txt_data)) {

  if(txt_data$Marks[i] >= 90) {

    cat("Topper:",
        txt_data$Name[i],
        "with Marks =",
        txt_data$Marks[i], "\n")

    break
  }

  i <- i + 1
}

# Running total
cat("\n--- Running Total (Stop > 200) ---\n")

total <- 0
i <- 1

while(total <= 200 && i <= nrow(txt_data)) {

  total <- total + txt_data$Marks[i]

  cat("Added",
      txt_data$Name[i],
      "(",
      txt_data$Marks[i],
      ") | Total:",
      total, "\n")

  i <- i + 1
}

cat("Loop stopped. Final Total =", total, "\n")


# ==========================================================
# Program 4d: REPEAT Loop on TXT File
# ==========================================================

txt_data <- read.table(
  "students.txt",
  header = TRUE,
  sep = "\t"
)

# Print all students
cat("\n--- All Student Names (TXT) ---\n")

i <- 1

repeat {

  cat("Student", i, ":",
      txt_data$Name[i], "\n")

  i <- i + 1

  if(i > nrow(txt_data))
    break
}

# Below average students
cat("\n--- Below Average Students ---\n")

avg <- mean(txt_data$Marks)

cat("Class Average:", avg, "\n")

i <- 1

repeat {

  if(txt_data$Marks[i] < avg) {

    cat("Below Avg:",
        txt_data$Name[i],
        "| Marks:",
        txt_data$Marks[i], "\n")
  }

  i <- i + 1

  if(i > nrow(txt_data))
    break
}

# Grade A students only
cat("\n--- Grade A Students ---\n")

i <- 1

repeat {

  if(txt_data$Grade[i] != "A") {

    i <- i + 1

    if(i > nrow(txt_data))
      break

    next
  }

  cat(txt_data$Name[i],
      "- Marks:",
      txt_data$Marks[i], "\n")

  i <- i + 1

  if(i > nrow(txt_data))
    break
}


# ==========================================================
# Program 4e: FOR Loop on CSV File
# ==========================================================

csv_data <- read.csv("students.csv")

cat("\n--- Data from students.csv ---\n")
print(csv_data)

# RollNo and City
cat("\n--- RollNo & City ---\n")

for(i in 1:nrow(csv_data)) {

  cat("RollNo:",
      csv_data$RollNo[i],
      "| City:",
      csv_data$City[i], "\n")
}

# Grade-wise count
cat("\n--- Grade-wise Count ---\n")

grades <- c("A", "B", "C", "D")

for(g in grades) {

  count <- sum(csv_data$Grade == g)

  cat("Grade", g,
      ":",
      count,
      "student(s)\n")
}

# Marks > 70
cat("\n--- Students with Marks > 70 ---\n")

filtered <- data.frame()

for(i in 1:nrow(csv_data)) {

  if(csv_data$Marks[i] > 70) {

    filtered <- rbind(
      filtered,
      csv_data[i, ]
    )
  }
}

print(filtered)

write.csv(
  filtered,
  "marks_above_70.csv",
  row.names = FALSE
)

cat("Exported to marks_above_70.csv\n")


# ==========================================================
# Program 4f: WHILE & REPEAT Loops on CSV File
# ==========================================================

csv_data <- read.csv("students.csv")

# Age verification
cat("\n--- Age Verification (CSV) ---\n")

i <- 1

while(i <= nrow(csv_data)) {

  status <- ifelse(
    csv_data$Age[i] >= 21,
    "Senior",
    "Junior"
  )

  cat(csv_data$Name[i],
      "(Age:",
      csv_data$Age[i],
      ") ->",
      status, "\n")

  i <- i + 1
}

# Top 3 marks
cat("\n--- Sum of Top 3 Marks ---\n")

sorted_marks <- sort(
  csv_data$Marks,
  decreasing = TRUE
)

total <- 0
i <- 1

while(i <= 3) {

  total <- total + sorted_marks[i]

  cat("Rank",
      i,
      "Marks:",
      sorted_marks[i],
      "| Running Sum:",
      total, "\n")

  i <- i + 1
}

cat("Sum of Top 3 Marks =", total, "\n")

# Nagpur students
cat("\n--- Nagpur Students (CSV) ---\n")

i <- 1

repeat {

  if(csv_data$City[i] == "Nagpur") {

    cat(csv_data$Name[i],
        "| Marks:",
        csv_data$Marks[i], "\n")
  }

  i <- i + 1

  if(i > nrow(csv_data))
    break
}