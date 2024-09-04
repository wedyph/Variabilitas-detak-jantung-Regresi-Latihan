#Input Data
library(readr)
data2 =read.csv("D:/project/data2.csv")
#Regresi Linear Berganda
model = lm (Heart_Rate_Variability ~ Sleep_Duration_Hours + Sleep_Quality_Score + Caffeine_Intake_mg + Stress_Level, data= data2)
summary(model)

#Uji Normalitas
library(MASS)
sresid = studres(model)
shapiro.test(sresid)

#Uji Homoskedastisitas
library(lmtest)
bptest(model, studentize=F)

#Uji Autokorelasi
library(lmtest)
dwtest(model)

#Uji Multikolinearitas
library(car)
vif(model)
