# **Financial_Performance_of_Polish_Firms**
## **Introduction**
This project builds a regression model to predict a Polish company's Financial performance using given
performance financial ratios over a 13 year period. The data used for analysis is a multivariate Polish
bankruptcy data set collected from 2000 to 2013. It contains 64 attributes labeled X1-X64. The data set and it's full
description can be downloaded from `http://archive.ics.uci.edu/ml/datasets/polish+companies+bankruptcy+data`
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
`The dependant variable is x1.` For independent variables selection I used the OLS assumptions. Some of the assumptions can be checked for before model building but others can only applied after the model building and therefore during the `model validation` process.

First and foremost I run correlation to check for variables that have a high correlation with the dependant variable (`correlation > 0.5`). Also to check for multicolinearity among the rest of the variables and therefore eliminating those that have high correlations with each other (`correlation > 0.7`) and those with a very low correlation with the dependant variable (`correlation < 0.4`)
### **Model Building**
The model is built backwards where we start off with including all the variables selected for the model and go on eliminating variablea that don't align with our criteria until we get the optimal variables for our final model.
### **Model Validation**
- In this section I run a check for outliers using the boxplots and decided to get rid of the outliers to stream line the accuracy of our model.

- I run a non-linearity check by randomly checking 2 variables that may have a non-linear relationship with our dependant variable.

- I run a `vif` score on the model to eliminate variables whose `vif > 2`. This is to minimize spikes in the covariances among the variables in the final model.

- Lastly I run a prediction accuracy on the model.
### **Conclusion**
I had a fun time doing this project, putting my `Machine  Learning` and `Business Analysis` skils to use. I'm so greatful that I've seen it to conclusion and hope many of you out there find it useful and educative.

`Thank you all!`
