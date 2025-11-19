# Customer Spending Analysis: Regression Model Development & Validation
## Project Overview
This project focuses on analyzing customer spending behavior to build predictive models that drive business insights. By leveraging R and the `Tidyverse` ecosystem, I performed an end-to-end analysis ranging from data cleaning and exploration to advanced regression modeling. The goal was to identify key drivers of total spending and predict future customer value using both linear and logistic regression techniques.
## Dataset
The analysis utilizes the `regression_model_final.csv` dataset, which contains customer demographic information and transaction history. Key variables include:
* `Income`: Annual income of the customer.
* `Age`: Customer age.
* `TotalSpend`: Total amount spent by the customer.
* `PurchaseHistoryScore`: A score representing past purchasing behavior.
* `DeviceUsed`: The device type used for transactions (Mobile, Tablet, Desktop).
## Technologies & Libraries
The project is built using R and relies on the following libraries for robust analysis and visualization:
* `tidyverse` (`dplyr`, `ggplot2`, `tibble`, `readr`): For data manipulation and visualization.
* `broom`: For tidying model outputs into predictable data frames.
* `car`: For regression diagnostics, specifically checking multicollinearity (`VIF`).
## Analytical Workflow
### Phase 1: Data Preparation & Exploration
Before modeling, I ensured data integrity through a rigorous cleaning process.
* **Data Cleaning:** Identified and removed missing values (`NA`) to prevent skewing analysis results.
* **Statistical Summary:** Calculated baseline statistics (`Mean`, `Standard Deviation`) for core variables (`Income`, `Age`, `TotalSpend`) to understand the central tendency and dispersion of the data.
### Phase 2: Exploratory Data Analysis (EDA) with `ggplot2`
I visualized the data to uncover underlying patterns and distributions:
* **Distribution Analysis:** Created histograms to analyze the spread of `TotalSpend`, revealing a right-skewed distribution indicating a niche segment of high-value customers.
* **Multivariate Analysis:** Plotted `Income` vs. `TotalSpend`, segmented by `DeviceUsed`. This scatter plot with linear trend lines highlighted a clear positive correlation between income and spending, with distinct behaviors across different devices.
### Phase 3: Model Development
I developed multiple regression models to quantify relationships between variables:
1. **Simple Linear Regression:** Modeled `TotalSpend` as a function of `Income` to establish a baseline relationship.
2. **Multiple Linear Regression:** Expanded the model to include `Age` and `PurchaseHistoryScore`, providing a more holistic view of spending drivers.
3. **Evaluation:** Utilized `summary()` and `broom::glance()` to extract R-squared values and coefficients, ensuring the models were statistically significant.
### Phase 4: Model Validation & Predictive Analytics
To ensure the reliability of the models, I performed extensive validation and predictive tasks:
* **Assumption Checking:**
  * **Multicollinearity:** Calculated Variance Inflation Factors (`VIF`) to ensure independent variables were not highly correlated.
  * **Normality:** Conducted **Shapiro-Wilk tests** and generated **Q-Q plots** to verify the normality of residuals.
* **Forecasting:** Used the multiple regression model to `predict` `TotalSpend` for specific customer profiles, generating prediction intervals to account for uncertainty.
* **Classification (Logistic Regression):** Engineered a binary `HighSpender` feature (Spend > $500) and trained a logistic regression model to estimate the probability of a customer being a high-value spender.
## Key Insights & Recommendations
Based on the analysis, the following conclusions were drawn:
1. **Device Impact:** Desktop users demonstrate significantly higher total spending compared to Mobile and Tablet users.
2. **Income Correlation:** There is a strong positive correlation between `Income` and `TotalSpend`.
3. **Spending Distribution:** The right-skew of the data suggests a small percentage of "whale" customers drive a large portion of revenue.
## How to Run
1. Ensure **R** is installed along with the required packages:
> `install.packages(c("tidyverse", "broom", "car", "httpgd"))`
2. Place `regression_model_final.csv` in the working directory.
3. Run the analysis script:
> `source("regression_model_final.r")`
