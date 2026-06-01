# ==========================================================
# PRACTICAL NO. 6
# AIM:
# Data Visualization using Graphical Representation in R
# Case Study: Analyzing Student Exam Performance
# ==========================================================

# ==========================================================
# Step 1: Create Student Dataset
# ==========================================================

student_df <- data.frame(
  Name = c("Student1", "Student2", "Student3", "Student4", "Student5",
           "Student6", "Student7", "Student8", "Student9", "Student10"),

  Gender = c("Male", "Female", "Male", "Female", "Male",
             "Female", "Male", "Female", "Male", "Female"),

  StudyHours = c(6, 8, 4, 9, 5, 7, 3, 10, 6, 8),

  ExamScore = c(72, 85, 60, 91, 65, 78, 55, 95, 70, 88),

  Subject = c("Math", "Science", "Math", "Science", "Math",
              "Science", "Math", "Science", "Math", "Science")
)

# ==========================================================
# Step 2: Display Dataset
# ==========================================================

cat("--- Student Exam Performance Dataset ---\n")
print(student_df)

cat("\n--- Dataset Summary ---\n")
print(summary(student_df[, c("StudyHours", "ExamScore")]))

# ==========================================================
# Step 3: Statistical Analysis
# ==========================================================

cat("\n--- Gender-wise Mean Score ---\n")

male_scores <- student_df$ExamScore[student_df$Gender == "Male"]
female_scores <- student_df$ExamScore[student_df$Gender == "Female"]

cat("Mean Score (Male):", mean(male_scores), "\n")
cat("Mean Score (Female):", mean(female_scores), "\n")
cat("Overall Mean Score:", mean(student_df$ExamScore), "\n")
cat("Correlation (Hours-Score):",
    cor(student_df$StudyHours, student_df$ExamScore), "\n")


# ==========================================================
# Graph 1: Bar Chart – Gender-wise Mean Exam Score
# ==========================================================

cat("\nPlotting Graph 1: Bar Chart\n")

gender_mean <- tapply(
  student_df$ExamScore,
  student_df$Gender,
  mean
)

barplot(
  gender_mean,
  main = "Gender-wise Mean Exam Score",
  xlab = "Gender",
  ylab = "Mean Exam Score",
  col = c("steelblue", "tomato"),
  border = "black",
  ylim = c(0, 100),
  names.arg = c("Female", "Male")
)

legend(
  "topright",
  legend = c("Female", "Male"),
  fill = c("steelblue", "tomato")
)


# ==========================================================
# Graph 2: Histogram – Distribution of Exam Scores
# ==========================================================

cat("\nPlotting Graph 2: Histogram\n")

hist(
  student_df$ExamScore,
  main = "Distribution of Exam Scores",
  xlab = "Exam Score",
  ylab = "Frequency",
  col = "skyblue",
  border = "navy",
  breaks = 5,
  xlim = c(50, 100)
)

abline(
  v = mean(student_df$ExamScore),
  col = "red",
  lwd = 2,
  lty = 2
)

legend(
  "topright",
  legend = "Mean Score",
  col = "red",
  lty = 2,
  lwd = 2
)


# ==========================================================
# Graph 3: Scatter Plot – Study Hours vs Exam Score
# ==========================================================

cat("\nPlotting Graph 3: Scatter Plot\n")

colors <- ifelse(
  student_df$Gender == "Male",
  "steelblue",
  "tomato"
)

plot(
  student_df$StudyHours,
  student_df$ExamScore,
  main = "Study Hours vs Exam Score",
  xlab = "Study Hours",
  ylab = "Exam Score",
  col = colors,
  pch = 19,
  cex = 1.5,
  xlim = c(2, 11),
  ylim = c(50, 100)
)

abline(
  lm(ExamScore ~ StudyHours, data = student_df),
  col = "darkgreen",
  lwd = 2
)

legend(
  "topleft",
  legend = c("Male", "Female", "Trend Line"),
  col = c("steelblue", "tomato", "darkgreen"),
  pch = c(19, 19, NA),
  lty = c(NA, NA, 1),
  lwd = c(NA, NA, 2)
)


# ==========================================================
# Graph 4: Line Graph – Rank vs Exam Score
# ==========================================================

cat("\nPlotting Graph 4: Line Graph\n")

sorted_df <- student_df[order(student_df$ExamScore), ]
sorted_df$Rank <- 1:nrow(sorted_df)

plot(
  sorted_df$Rank,
  sorted_df$ExamScore,
  type = "b",
  main = "Student Rank vs Exam Score",
  xlab = "Rank (1 = Lowest)",
  ylab = "Exam Score",
  col = "purple",
  pch = 16,
  lwd = 2
)

text(
  sorted_df$Rank,
  sorted_df$ExamScore,
  labels = sorted_df$Name,
  pos = 3,
  cex = 0.75,
  col = "black"
)


# ==========================================================
# Graph 5: Pie Chart – Grade Distribution
# ==========================================================

cat("\nPlotting Graph 5: Pie Chart\n")

student_df$Grade <- cut(
  student_df$ExamScore,
  breaks = c(0, 60, 75, 85, 100),
  labels = c("C (<60)", "B (60-75)",
             "A (75-85)", "O (85-100)"),
  right = FALSE
)

grade_count <- table(student_df$Grade)

pie_pct <- round(
  100 * prop.table(grade_count),
  1
)

pie_labels <- paste(
  names(grade_count),
  "\n",
  pie_pct,
  "%"
)

pie(
  grade_count,
  labels = pie_labels,
  main = "Grade Distribution of Students",
  col = c("#E74C3C", "#F39C12",
          "#2ECC71", "#3498DB"),
  clockwise = TRUE
)


# ==========================================================
# Graph 6: Box Plot – Score by Gender
# ==========================================================

cat("\nPlotting Graph 6: Box Plot\n")

boxplot(
  ExamScore ~ Gender,
  data = student_df,
  main = "Exam Score Distribution by Gender",
  xlab = "Gender",
  ylab = "Exam Score",
  col = c("tomato", "steelblue"),
  border = "black",
  notch = FALSE,
  outline = TRUE
)

stripchart(
  ExamScore ~ Gender,
  data = student_df,
  method = "jitter",
  col = "black",
  pch = 16,
  vertical = TRUE,
  add = TRUE
)