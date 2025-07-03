# Real-estate-prices
project multiple linear regression 
# Multiple Linear Regression – Startup Profit Prediction

This project applies **multiple linear regression** to model and analyze how various business expenditures (R&D, marketing, and administration) influence company profits. The analysis is based on the `50_Startups.csv` dataset as part of the W4479 Applied Project using R (Winter Semester 2023/2024).

## Objectives

- Fit 7 linear regression models with different combinations of predictors:
  - `R&D Spend`, `Marketing Spend`, and `Administration`
- Compare **estimated coefficients**, **R²**, and **adjusted R²**
- Select the best model based on adjusted R²
- Construct **95% and 99% confidence intervals** for coefficients
- Perform a joint significance **F-test** on slope parameters

## Tools & Packages

- `ggplot2`, `ggpubr` – visualization  
- `dplyr`, `tidyr` – data handling  
- `car` – linear hypothesis testing  
- Base R – regression modeling, diagnostics, and CI calculations

## Key Findings

- The model using **R&D Spend and Marketing Spend** (`reg_23`) had the highest adjusted R²  
- Both predictors are statistically significant  
- Confidence intervals support robustness of the estimates  
- The **F-test** confirms joint significance of the slope coefficients at both α = 0.05 and 0.01

## Input Data

- `50_Startups.csv`:  
  Contains variables:
  - `Profit` (target)
  - `R.D.Spend`
  - `Marketing.Spend`
  - `Administration`

---

> Developed for Problem 4 of the W4479 Applied Project using R (Winter 2023/2024)
