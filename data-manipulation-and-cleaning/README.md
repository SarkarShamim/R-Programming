# Retail Data Analysis & Preparation with R/Tidyverse

## Project Summary

This repository contains a comprehensive R script for cleaning, preparing, and transforming a raw retail dataset into an analysis-ready format. This project demonstrates my proficiency with the R Tidyverse ecosystem, showcasing advanced data wrangling techniques essential for any data science workflow.


## Dataset

The project utilizes a `retail_set12.csv` file, which contains typical retail transaction data.


## Core Competencies & Technologies

This project highlights my experience with key data manipulation libraries and concepts within R:

* `dplyr`: Leveraged for efficient data manipulation, including outlier detection, filtering, and the creation of new calculated fields.

* `tidyr`: Utilized for structuring and tidying data, specifically separating combined fields into more granular, usable components.

* `stringr`: Applied for advanced string and text manipulation to standardize inconsistent address data.

* `readr`: Used for fast and reliable data import.

You can install the necessary packages by running:

`install.packages(c("readr", "dplyr", "tidyr", "stringr"))`


## How to Run This Project

1. Ensure R and the Tidyverse packages are installed.

2. Clone this repository.

3. Place the `retail_set12.csv` dataset in the project's root directory.

4. Execute the `final_project_data.R` script in an R environment. The cleaned data will be available in the `retail_df` data frame.


## Key Data Processing Features

**1. Robust Missing Value Imputation**

I've implemented a strategy to handle missing data by imputing `UnitPrice` with the column's median and `Quantity` with its mean, ensuring data integrity for downstream analysis.

**2. Intelligent Duplicate and Outlier Removal**

Developed logic to identify and eliminate duplicate records based on a composite key (`CustomerID`, `OrderDate`, `ProductDescription`) and effectively filtered outliers to create a more focused dataset.

**3. Advanced Text & String Manipulation**

Standardized address information by programmatically expanding common abbreviations (e.g., "St" to "Street", "Blvd" to "Boulevard"), demonstrating proficiency in text data cleaning.

**4. Data Restructuring and Feature Engineering**

* **Address Decomposition:** Deconstructed the monolithic `Address` field into atomic components (`StreetNumber`, `StreetName`, `City`, etc.) for easier querying and analysis.

* **Name Parsing:** Parsed the `FullName` field into `FirstName` and `LastName`.

* **Calculated Fields:** Engineered new, valuable features such as `TotalRevenue` (from `UnitPrice * Quantity`) and `EuroPrice` (applying a currency conversion), adding depth to the dataset.
