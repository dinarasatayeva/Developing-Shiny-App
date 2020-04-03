---
title: "Shiny App. Probability of Surviving on Titanic"
author: "Dinara Satayeva"
date: "4/3/2020"
output:
  slidy_presentation: 
    keep_md: yes
  ioslides_presentation: default
---



## Overview

The Shiny App: Probability of Surviving on Titanic is an interactive app that allows user to input some numbers and based on the numbers calculates probability of survival on Titanic. 

Moreover, the app shows a little os stats about people that were on Titanic, represented in graphs.

"Titanic.csv" dataset was used for calculations. 

First we built a logistic model, with categories shown on next slide as predictors. 

Then we used the newly produced model to predict aginst new dataset, built based on user input.

## Input numbers

- Age
- Sex
- Class
- Fare
- Number of children/parents aboard
- Number of siblings/spouses aboard

## Overview of the dataset


```r
data<-read.csv("titanic.csv")
dim(data)
```

```
[1] 887   8
```

```r
head(data)
```

```
  survived pclass                                               name    sex age
1        0      3                             Mr. Owen Harris Braund   male  22
2        1      1 Mrs. John Bradley (Florence Briggs Thayer) Cumings female  38
3        1      3                              Miss. Laina Heikkinen female  26
4        1      1        Mrs. Jacques Heath (Lily May Peel) Futrelle female  35
5        0      3                            Mr. William Henry Allen   male  35
6        0      3                                    Mr. James Moran   male  27
  sib_sp par_ch    fare
1      1      0  7.2500
2      1      0 71.2833
3      0      0  7.9250
4      1      0 53.1000
5      0      0  8.0500
6      0      0  8.4583
```

## Summary of the logistic model


```
## 
## Call:
## glm(formula = survived ~ pclass + sex + age + sib_sp + par_ch + 
##     fare, family = "binomial", data = data)
## 
## Deviance Residuals: 
##     Min       1Q   Median       3Q      Max  
## -2.7789  -0.5976  -0.3987   0.6156   2.4409  
## 
## Coefficients:
##              Estimate Std. Error z value Pr(>|z|)    
## (Intercept)  5.297252   0.557409   9.503  < 2e-16 ***
## pclass      -1.177659   0.146079  -8.062 7.52e-16 ***
## sexmale     -2.757282   0.200416 -13.758  < 2e-16 ***
## age         -0.043474   0.007723  -5.629 1.81e-08 ***
## sib_sp      -0.401831   0.110712  -3.630 0.000284 ***
## par_ch      -0.106505   0.118588  -0.898 0.369127    
## fare         0.002786   0.002389   1.166 0.243680    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## (Dispersion parameter for binomial family taken to be 1)
## 
##     Null deviance: 1182.77  on 886  degrees of freedom
## Residual deviance:  780.93  on 880  degrees of freedom
## AIC: 794.93
## 
## Number of Fisher Scoring iterations: 5
```

## Ploting data
![](Presentation-Di_files/figure-slidy/unnamed-chunk-3-1.png)<!-- -->
