# Healthcare Patient Data Analysis
This repository contains an R script (`healthcare_analysis.R` - you can rename your script file as needed) for exploring, analyzing, and visualizing a patient healthcare dataset (`healthcare_final.csv`). The project uses R with the `dplyr`, `ggplot2`, and `plotly` libraries to perform a series of data analysis tasks.
# Dataset
* `healthcare_final.csv`: The primary dataset used for this analysis. It contains patient demographic information, medical details, visit information, and healthcare costs.
# Analysis Overview
The R script performs a comprehensive exploratory data analysis (EDA) on the healthcare dataset. The analysis proceeds as follows:
1. **Data Loading & Initial Inspection:** The `healthcare_final.csv` dataset is loaded using `readr`. Initial summary statistics (mean age, median BMI, cost standard deviation, and cost range) are calculated, and the data structure and variable types are examined using `str()`.
2. **Categorical Variable Analysis:** The script explores the distribution of key categorical variables. It generates frequency counts for `Region` and `VisitType` and visualizes these distributions using `ggplot2` bar charts.
3. **Exploring Relationships:** Bivariate relationships are investigated, specifically focusing on how `HealthcareCost` relates to patient `Age`. This is visualized with a scatter plot, which is further enhanced by color-coding based on `Smoker` status to reveal trends within different patient groups.
4. **Multivariate Visualization:** The analysis delves into cost distributions across different groups using interactive boxplots.
    * First, an interactive `plotly` boxplot examines the spread of `HealthcareCost` by `InsuranceProvider`.
    * Second, a faceted boxplot is created to compare `HealthcareCost` by `Region`, with separate panels for each `VisitType`, allowing for a more granular comparison.
5. **Feature Engineering & Deeper Insights:** A new variable, `CostPerDay` (`HealthcareCost / DaysInHospital`), is engineered to normalize costs. The script then calculates summary statistics (mean, median, standard deviation) for this new metric, grouped by `Region`. Finally, a boxplot is generated to visualize the distribution of `CostPerDay` across regions.
# Libraries Used
The script requires the following R libraries:
* `dplyr` (for data manipulation)
* `ggplot2` (for static visualizations)
* `lubridate` (loaded, though not explicitly used in the provided snippets)
* `plotly` (for interactive visualizations)
* `readr` (for reading the CSV file)
# How to Run
1. Ensure you have R and RStudio (or another R environment) installed.
2. Install the required libraries:
> `install.packages(c("dplyr", "ggplot2", "lubridate", "plotly", "readr"))`
3. Place the `healthcare_final.csv` file in the same directory as the R script.
4. Run the R script to perform the analysis and generate the visualizations.
