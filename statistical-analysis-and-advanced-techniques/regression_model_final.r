# ================================================
# Final Project: Regression Model Development and Validation
# Module 5 - Final Project
# ================================================

# ================================================
# Graded Challenge 1: Data Preparation & Exploration 
# ================================================

# Step 1: Load dependencies and dataset
library(tidyverse)     # For data wrangling and visualization
library(broom)         # For tidying model outputs
library(car)           # For checking multicollinearity
library(ggplot2)       # For plotting
library(httpgd)
library(tibble)
library(dplyr)

# Load dataset
analysis_df <- read_csv("regression_model_final.csv")

# Step 2: Examine structure and summary statistics
str(analysis_df)
summary(analysis_df)

# Step 3: Identify and remove missing values
sum(is.na(analysis_df))
analysis_df <- drop_na(analysis_df)

# Step 4: Calculate mean and standard deviation for:
mean_income <- mean(analysis_df$Income)
mean_age <- mean(analysis_df$Age)
mean_totalspend <- mean(analysis_df$TotalSpend)

sd_income <- sd(analysis_df$Income)
sd_age <- sd(analysis_df$Age)
sd_totalspend <- sd(analysis_df$TotalSpend)


# ================================================
# Graded Challenge 2: Data Visualization with ggplot2
# ================================================

# Step 1: Create a histogram of TotalSpend and store in plot_1
# - Fill color: skyblue
# - Border color: black
# - Bins: 30
# - Title: "Distribution of Total Spend"
# - X-axis: "Total Spend"
# - Y-axis: "Number of Customers"

plot_1 <- ggplot(analysis_df, aes(x = TotalSpend)) +
  geom_histogram(fill = "skyblue", color = "black", bins = 30) +
  labs(title = "Distribution of Total Spend",
       x = "Total Spend",
       y = "Number of Customers")
print(plot_1)

# Step 2: Scatter plot of Income vs TotalSpend
# - Color points by DeviceUsed
# - Add a linear trend line
# - Title: "Income vs Total Spend by Device Used"

plot_2 <- ggplot(analysis_df, aes(x = Income, y = TotalSpend, color = DeviceUsed)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Income vs Total Spend by Device Used",
       x = "Income",
       y = "Total Spend")
print(plot_2)

# Step 3: Insights and Recommendations
# Describe 3–4 sentences about key findings
# Provide 2 bullet-style recommendations

# KEY FINDINGS:
# Finding 1: Desktop users tend to have higher TotalSpend compared to Mobile and Tablet users.
# Finding 2: There is a positive correlation between Income and TotalSpend, indicating that as income increases, total spending also tends to increase.
# Finding 3: The distribution of TotalSpend is right-skewed, suggesting that a small number of customers contribute to a large portion of total spending.

# - Recommendation 1: Focus marketing efforts on Desktop users, as they show higher spending behavior.
# - Recommendation 2: Develop targeted campaigns for higher-income segments to maximize TotalSpend.


# ================================================
# Graded Challenge 3: Model Development
# ================================================

# Step 1: Build a simple regression model: TotalSpend ~ Income
model_simple <- lm(TotalSpend ~ Income, data = analysis_df)
print(summary(model_simple))

# Step 2: Report R-squared and interpret slope
r_squared_simple <- summary(model_simple)$r.squared
cat("R-squared for the simple model:", r_squared_simple, "\n")

slope_simple <- coef(model_simple)["Income"]
cat("Slope for the simple model:", slope_simple, "\n")

# Step 3: Build a multiple regression model with:
# Income, Age, PurchaseHistoryScore
model_multi <- lm(TotalSpend ~ Income + Age + PurchaseHistoryScore, data = analysis_df)

# Step 4: Use summary() and broom::glance() to evaluate
summary <- summary(model_multi)
print(summary)

# Add broom::glance() here
broom_evaluation <- broom::glance(model_multi)
print(broom_evaluation)


# ================================================
# Graded Challenge 4: Model Validation & Prediction
# ================================================

# Pre Reqs: Use the model created in Activity 3.
# Step 1: Use diagnostic plots and vif() to evaluate assumptions using par() with c(2,2)

par(mfrow = c(2, 2))
vif(model_multi)
plot_4 <- plot(model_multi)
print(plot_4)

# Step 2: Check for normality using qqnorm(), qqline(), and shapiro.test()
qqnorm <- qqnorm(residuals(model_multi))
qqline <- qqline(residuals(model_multi))

shapiro_result <- shapiro.test(residuals(model_multi))
print(shapiro_result)

# Step 3: Predict TotalSpend for 3 new customer profiles
# - Customer 1: (Income = 55000, Age: 30, PurchaseHistoryScore: 60)
# - Customer 2: (Income = 75000, Age: 45, PurchaseHistoryScore: 80)
# - Customer 3: (Income = 95000, Age: 60, PurchaseHistoryScore: 90)

new_profiles <- tibble(
  Income = c(55000, 75000, 95000),
  Age = c(30, 45, 60),
  PurchaseHistoryScore = c(60, 80, 90)
)

# Step 4: Add prediction intervals and interpret results
prediction_intervals <- predict(model_multi, newdata = new_profiles, interval = "prediction")
print(prediction_intervals)

# Step 5: Estimate likelihood of high spending behavior
# Fill in the blanks with your code below

# Part A: Create a binary variable 'HighSpender' where TotalSpend > 500
analysis_df_final <- analysis_df %>%
    mutate(HighSpender = ifelse(TotalSpend > 500, 1, 0))

# Part B: Fit a logistic regression model predicting HighSpender from Age, Income, and PurchaseHistoryScore
logistic_model <- glm(HighSpender ~ Age + Income + PurchaseHistoryScore,
              data = analysis_df_final, family = binomial)

# Part C: Create a new tibble with a hypothetical customer profile
# - Customer: (Income = 50000, Age: 40, PurchaseHistoryScore: 70)

test_customer <- tibble(
  Income = 50000,
  Age = 40,
  PurchaseHistoryScore = 70
)

# Part D: Use predict(..., type = "response") to estimate probability
# Predict probability of high spending
predicted_probability <- predict(logistic_model, newdata = test_customer, type = "response")
print(predicted_probability)