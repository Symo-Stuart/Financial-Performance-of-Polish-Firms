# **Financial-Performance-of-Polish-Firms**
This project will be looking at building a Machine Learning Linear Regression Model to predict whether a given polish firm is headed for bankruptcy or not
## **Introduction**
This project intends to build a regression model to predict a Polish company's performance using given
performance criteria. The data used for analysis is a multivariate Polish
bankruptcy data set collected from 2000 to 2013. It contains 64 attributes labeled X1-X64. The full
description attached in the image below.
## **Topics to be covered include;**
- `Importing data into R-Studio`
- `Loading the Required libraries`
- `Data Familiarizaztion`
- `Variable Selection`
- `Model Building`
- `Model Validation`

### **Importing Data into R-studio**
There are different ways of importing data into R for analysis. This normally depends on the file type of the data set a given individual is using and also what's convenient for them.

Personally I prefer the `read.csv` route because more often I deal with *csv* files. I find them faster to Extract, Load and Transform with in R.

Fair to say the goal is to get the data into R, which ever way you pick to do that as ling as it effectively gets the data into your tool for analysis, you're good to go.
### **Loading the Required Libraries**
Libraries to be loaded depend on your analysis needs. For instance if you're going to be running any descriptive statistics or correlations or the kind of model you're building. Is it a classification model or a linear regression model. It all depends on your Analysis needs.

For this Particular Project needs, I'm running the following libraries;

- `car`
- `psych`
- `Hmisc`
- `naniar`
- `corrplot`
- `ggplot2`
- `naniar`

### **Data Familiarization**
This section includes data types checking, data cleaning, and checking for missing values.
### **Variable Selection**
The main criteria for variable selection is checking whether the assumptions for linear regression hold for your variables and for your model. Some of the assumptions can be checked for before model building but others can only apply after the model building and therefore during the `model validation` process.

First and foremost I run correlation to check for variables that have a high correlation with the dependant variable (`correlation > 0.5`). Also to check for multicolinearity among the rest of the variables and therefore eliminating those that have high correlations with each other (`correlation > 0.7`) and those with a very low correlation with the dependant variable (`correlation < 0.4`)