###############################################################################
#                                                                             #
#        W4479 - Applied project using R, winter semester 2023 / 2024         #
#                                                                             #
#                     Problem 4: Multiple Linear Regression                   #
#                                                                             #
###############################################################################

# Information:

# Use this file to save your code for solving Problem 4 of the applied 
# project.


# <------- Start here with your own code --------> # 
library(ggplot2)
library(tidyr)
library(ggpubr)
library(car)
start_up <- read.csv("50_Startups.csv",header = TRUE)
head(start_up,6)
str(start_up)
Y <- start_up$Profit
X2 <- start_up$R.D.Spend
X3 <- start_up$Marketing.Spend
X4 <- start_up$Administration
#a) explanation ----

#b) state the estimated coefficients together
# 7 regressions
# One exog. variable:
reg_1 <- lm(Y ~ X2, data = start_up)
reg_2 <- lm(Y ~ X3, data = start_up)
reg_3 <- lm(Y ~ X4, data = start_up)
# Two exog. variable:
reg_23 <- lm(Y ~ X2 + X3,data = start_up)
reg_24 <- lm(Y ~ X2 + X4,data = start_up)
reg_34 <- lm(Y ~ X3 + X4,data = start_up)
# Three exog. variable:
reg_234 <- lm(Y ~ X2 + X3 + X4)
# Summary shown for reg_234 (others not shown here in the slides)
summary(reg_234)
summary(reg_234)$coef

#c) Compare the changes in estimated slope coefficients among the seven models----

#d) state the corresponding R^2 and adjusted R^2 for all models
#M1 model 1
M1 <- summary(reg_1)$r.squared
adj.M1 <- summary(reg_1)$adj.r.squared
#M2 model 2
M2 <- summary(reg_2)$r.squared
adj.M2 <- summary(reg_2)$adj.r.squared
#M3 model 3
M3 <- summary(reg_3)$r.squared
adj.M3 <- summary(reg_3)$adj.r.squared
#M23 model 23
M23 <- summary(reg_23)$r.squared
adj.M23 <- summary(reg_23)$adj.r.squared
#24 model 24
M24 <- summary(reg_24)$r.squared
adj.M24 <- summary(reg_24)$adj.r.squared
#34 model 34
M34 <- summary(reg_34)$r.squared
adj.M34 <- summary(reg_34)$adj.r.squared
#234 model 234
M234 <- summary(reg_234)$r.squared
adj.M234 <- summary(reg_234)$adj.r.squared
#put all R in data frame
#R^2 for all data frame
R_Squared <- data.frame(
  R_Squared_M1 = M1,
  R_Squared_M2 = M2,
  R_Squared_M3 = M3,
  R_Squared_M23 = M23,
  R_Squared_M24 = M24,
  R_Squared_M34 = M34,
  R_Squared_M234 = M234
)
R_Squared
# adj.r.squared 
Adj.R.Squared <- data.frame(
  adj.M1 = adj.M1,
  adj.M2 = adj.M2,
  adj.M3 = adj.M3,
  adj.M23 = adj.M23,
  adj.M24 = adj.M24,
  adj.M34 = adj.M34,
  adj.M234 = adj.M234
)
Adj.R.Squared
# display all the data in a table and explain which model that i use 

#e)Calculate the 95% and 99% confidence intervals for all parameters β ---
# model that i choose with the highest adj.r.squared is Model M23
summary(reg_23)
#95% CI for b1
reg_23$coefficients
b1 <- coef(reg_23)[[1]]
n <- nrow(start_up)
df <- n-3 
t.950 <- qt(0.950, df = df)
se.b1 <- summary(reg_23)$coefficients[1,2]
b1.low <- b1 - t.950 * se.b1
b1.high <- b1 + t.950 * se.b1
round(c("0.050" = b1.low, b1 = b1, "0.950" = b1.high), digits = 4)

#95% CI for b2
summary(reg_23)
b2 <- coef(reg_23)[[2]]
n <- nrow(start_up)
df <- n-3 
t.950 <- qt(0.950, df = df)
se.b2 <- summary(reg_23)$coefficients[2,2]
b2.low <- b2 - t.950 * se.b2
b2.high <- b2 + t.950 * se.b2
round(c("0.050" = b2.low, b2 = b2, "0.950" = b2.high), digits = 4)

# 95% CI for b3
summary(reg_23)
b3 <- coef(reg_23)[[3]]
n <- nrow(start_up)
df <- n-3 
t.950 <- qt(0.950, df = df)
se.b3 <- summary(reg_23)$coefficients[3,2]
b3.low <- b3 - t.950 * se.b3
b3.high <- b3 + t.950 * se.b3
round(c("0.050" = b3.low, b3 = b3, "0.950" = b3.high), digits = 4)

#99CI for b1
summary(reg_23)
b1 <- coef(reg_23)[[1]]
n <- nrow(start_up)
df <- n-3 
t.990 <- qt(0.990, df = df)
se.b1 <- summary(reg_23)$coefficients[1,2]
b1.low <- b1 - t.990 * se.b1
b1.high <- b1 + t.990 * se.b1
round(c("0.010" = b1.low, b1 = b1, "0.990" = b1.high), digits = 4)
# 99CI for b2
summary(reg_23)
b2 <- coef(reg_23)[[2]]
n <- nrow(start_up)
df <- n-3 
t.990 <- qt(0.990, df = df)
se.b2 <- summary(reg_23)$coefficients[2,2]
b2.low <- b2 - t.990 * se.b2
b2.high <- b2 + t.990 * se.b2
round(c("0.010" = b2.low, b2 = b2, "0.990" = b2.high), digits = 4)

## 99CI for b3
summary(reg_23)
b3 <- coef(reg_23)[[3]]
n <- nrow(start_up)
df <- n-3 #what is the df exactly?
t.990 <- qt(0.990, df = df)
se.b3 <- summary(reg_23)$coefficients[3,2]
b3.low <- b3 - t.990 * se.b3
b3.high <- b3 + t.990 * se.b3
round(c("0.010" = b3.low, b3 = b3, "0.990" = b3.high), digits = 4)

#f) Use a F -test to test the joint significance of the slope parameters at α = 0.05, 0.01----
#a)Calculate F statistic "by hand"at α = 0.05 by using packages (car)
#using with linear hypothesis tutorial 8
linearHypothesis(reg_23, c("X2 = 0", "X3 = 0"))

