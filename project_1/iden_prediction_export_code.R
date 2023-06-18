library(XLConnect)
library(xlsx)
library(utils)
library(tidyverse)
library(forecast)

set.seed(123)

# S01 VAR01
s1.v1 <- ts(s1$Var01) |>
  tsclean(lambda = "auto") |>
  Arima(order=c(2,1,2), lambda=0) |>
  forecast(h=140) |>
  data.frame() |>
  select(Point.Forecast) |>
  rename(Var01 = Point.Forecast)

# S01 VAR02
s1.v2 <- ts(s1$Var02) |>
  tsclean(lambda = "auto") |>
  auto.arima(lambda = 0) |>
  forecast(h=140) |>
  data.frame() |>
  select(Point.Forecast) |>
  rename(Var02 = Point.Forecast)

### S01 MASTER ###
S01 <- cbind(s1.v1, s1.v2)
### 

# S02 VAR02
s2.v2 <- ts(s2$Var02) |>
  tsclean(lambda = "auto") |>
  ses(h=140) |>
  data.frame() |>
  select(Point.Forecast) |>
  rename(Var02 = Point.Forecast)

# S02 VAR03
s2.v3 <- ts(s2$Var03) |>
  tsclean(lambda = "auto") |>
  ses(h=140) |>
  data.frame() |>
  select(Point.Forecast) |>
  rename(Var03 = Point.Forecast)

### S02 MASTER ###
S02 <- cbind(s2.v2, s2.v3)
###

# S03 VAR05
s3.v5 <- ts(s3$Var05) |>
  tsclean(lambda = "auto") |>
  ses(h=140) |>
  data.frame() |>
  select(Point.Forecast) |>
  rename(Var05 = Point.Forecast)

# S03 VAR07 
s3.v7 <- ts(s3$Var07) |>
  tsclean(lambda = "auto") |>
  ses(h=140) |>
  data.frame() |>
  select(Point.Forecast) |>
  rename(Var07 = Point.Forecast)

### S03 MASTER ###
S03 <- cbind(s3.v5, s3.v7)
###

# S04 VAR01 
s4.v1 <- ts(s4$Var07) |>
  tsclean() |>
  ets() |>
  forecast(h=140) |>
  data.frame() |>
  select(Point.Forecast) |>
  rename(Var01 = Point.Forecast)

# S04 VAR02
s4.v2 <- ts(s4$Var02) |>
  tsclean() |>
  ses(h=140) |>
  data.frame() |>
  select(Point.Forecast) |>
  rename(Var02 = Point.Forecast)

### S04 MASTER ###
S04 <- cbind(s4.v1, s4.v2)
### 

# S05 VAR02
s5.v2 <- ts(s5$Var02) |>
  tsclean() |>
  holt(damped=TRUE, h=140) |>
  data.frame() |>
  select(Point.Forecast) |>
  rename(Var02 = Point.Forecast)

# S05 VAR03
s5.v3 <- ts(s5$Var03) |>
  tsclean(lambda = "auto") |>
  holt(damped=TRUE, h=140) |>
  data.frame() |>
  select(Point.Forecast) |>
  rename(Var03 = Point.Forecast)

### S05 MASTER ###
S05 <- cbind(s5.v2, s5.v3)
###

# S06 VAR05
s6.v5 <- ts(s6$Var05) |>
  tsclean() |>
  ets() |>
  forecast(h=140) |>
  data.frame() |>
  select(Point.Forecast) |>
  rename(Var05 = Point.Forecast)

# S06 VAR07
s6.v7 <- ts(s6$Var07) |>
  tsclean() |>
  ets() |>
  forecast(h=140) |>
  data.frame() |>
  select(Point.Forecast) |>
  rename(Var07 = Point.Forecast)

### S06 MASTER ### 
S06 <- cbind(s6.v5, s6.v7)
###

### USING XLSX - FULL DATA
file <- "iden_data624_pj1_preds.xlsx"
write.xlsx(s1.v1, file, sheetName = "S01_VAR01")
write.xlsx(s1.v2, file, sheetName = "S01_VAR02", append=TRUE)
write.xlsx(s2.v2, file, sheetName = "S02_VAR02", append=TRUE)
write.xlsx(s2.v3, file, sheetName = "S02_VAR03", append=TRUE)
write.xlsx(s3.v5, file, sheetName = "S03_VAR05", append=TRUE)
write.xlsx(s3.v7, file, sheetName = "S03_VAR07", append=TRUE)
write.xlsx(s4.v1, file, sheetName = "S04_VAR01", append=TRUE)
write.xlsx(s4.v2, file, sheetName = "S04_VAR02", append=TRUE)
write.xlsx(s5.v2, file, sheetName = "S05_VAR02", append=TRUE)
write.xlsx(s5.v3, file, sheetName = "S05_VAR03", append=TRUE)
write.xlsx(s6.v5, file, sheetName = "S06_VAR05", append=TRUE)
write.xlsx(s6.v7, file, sheetName = "S06_VAR07", append=TRUE)

### SIX TAB WORKBOOK BY CATEGORY
file <- "iden_data624_pj1_preds.xlsx"
write.xlsx(S01, file, sheetName = "S01")
write.xlsx(S02, file, sheetName = "S02", append=TRUE)
write.xlsx(S03, file, sheetName = "S03", append=TRUE)
write.xlsx(S04, file, sheetName = "S04", append=TRUE)
write.xlsx(S05, file, sheetName = "S05", append=TRUE)
write.xlsx(S06, file, sheetName = "S06", append=TRUE)

