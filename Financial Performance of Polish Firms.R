#Importing Data into R_studio
data <- read.csv(file.choose(), header = TRUE)

# Loading the required Variable for Data Wrangling, Cleaning and Analysis
library(car)
library(psych)
library(Hmisc)
library(naniar)
library(corrplot)
library(ggplot2)
library(naniar)

#Checking for missing values.
any_na(data)
n_miss(data)
prop_miss(data)
data %>% is.na() %>% colSums()

#Running correlations
corr_data_x1 <- data[, c(1:49)]
corr_data_x1 <- na.omit(corr_data_x1)
oo <- options(max.print=2e+06)
library(Hmisc)
corr_table <- rcorr(as.matrix(corr_data_x1))
corr_table

#Eliminating variables due to multicolinearity
df1 = subset(corr_data_x1, select = c(x1,x3,x4,x5,x6,x7,x8,x9,x12,x15,x16,x23,x25,x26,x29,
                                x34,x36,x38,x46,x48,x50,x51,x55,x57,x59,x61,x63) )
corr_tablecorr_table <- rcorr(as.matrix(df1))

round(cor(df1),
      digits = 2 # rounded to 2 decimals
)

#Regression building     
reg1 <- lm(x1~.,data=df1)     
summary(reg1)    
coef(reg1)
car::vif(reg1)

reg2 <- lm(x1~.-x4-x16-x51-x12-x34-x38-x5-x3,data=df1)
summary(reg2)
car::vif(reg2)

reg3 <- lm(x1~.-x4-x16-x51-x12-x34-x38-x5-x3-x23,data=df1)
summary(reg3)
car::vif(reg3)

reg4 <- lm(x1~.-x4-x16-x51-x12-x34-x38-x5-x3-x23-x46,data=df1)
summary(reg4)
car::vif(reg4)
plot(reg4)

#Checking for Outliers using the Box plots
outliersx6<- boxplot(df1$x6, plot=FALSE)$out
outliersx9<- boxplot(df1$x9, plot=FALSE)$out
outliersx15<- boxplot(df1$x15, plot=FALSE)$out
outliersx25<- boxplot(df1$x25, plot=FALSE)$out
outliersx26<- boxplot(df1$x26, plot=FALSE)$out
outliersx29<- boxplot(df1$x29, plot=FALSE)$out
outliersx36<- boxplot(df1$x36, plot=FALSE)$out
outliersx48<- boxplot(df1$x48, plot=FALSE)$out
outliersx50<- boxplot(df1$x50, plot=FALSE)$out
outliersx55<- boxplot(df1$x55, plot=FALSE)$out
outliersx57<- boxplot(df1$x57, plot=FALSE)$out
outliersx59<- boxplot(df1$x59, plot=FALSE)$out
outliersx61<- boxplot(df1$x61, plot=FALSE)$out
outliersx63<- boxplot(df1$x63, plot=FALSE)$out

## Removing outliers
df2<-df1

df2<- df2[-which(df2$x6 %in% outliersx6),]
df2<- df2[-which(df2$x9 %in% outliersx9),]
df2<- df2[-which(df2$x15 %in% outliersx15),]
df2<- df2[-which(df2$x25 %in% outliersx25),]
df2<- df2[-which(df2$x26 %in% outliersx26),]
df2<- df2[-which(df2$x29 %in% outliersx29),]
df2<- df2[-which(df2$x36 %in% outliersx36),]
df2<- df2[-which(df2$x48 %in% outliersx48),]
df2<- df2[-which(df2$x50 %in% outliersx50),]
df2<- df2[-which(df2$x55 %in% outliersx55),]
df2<- df2[-which(df2$x57 %in% outliersx57),]
df2<- df2[-which(df2$x59 %in% outliersx59),]
df2<- df2[-which(df2$x61 %in% outliersx61),]
df2<- df2[-which(df2$x63 %in% outliersx63),]

reg5 <- lm(x1 ~ +x6+x9+x15+x25+x26+x29+x36+x48+x50+x55+x57+x59+x61+x63,data=df2)
summary(reg5)
car::vif(reg5)
plot(reg5)

reg6 <- lm(x1 ~ +x6+x15+x25+x29+x36+x48+x55+x59+x61,data=df2)
summary(reg6)
car::vif(reg6)
plot(reg6)

#Testing for non-linearity
df2$zx48 <- scale(df2$x48)
df2$zx48sq <- df2$zx48*df2$zx48

reg7 <- lm(x1 ~ +x6+x15+x25+x29+x36+x48+x55+x59+x61+zx48sq,data=df2)
summary(reg7)
car::vif(reg7)
plot(reg7)

#Accuracy of the model
df2$prediction1 <- predict(reg7, data = df2, type = "response")
mean(abs(df2$prediction1 - df2$x1))
cor(df2$prediction1, df2$x1)

