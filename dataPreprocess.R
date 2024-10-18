
library(readxl)
usedcars<-read.csv(file.choose(),stringsAsFactors = FALSE)
str(usedcars)

#Summary(min,mode,median,max) of year column
summary(usedcars$year)

#Summary of price and mileage column
summary(usedcars[c("price","mileage")])

#Range of price column 
range(usedcars$price)
diff(range(usedcars$price))
quantile(usedcars$price,seq(from=0, to=1,by=0.10))

# table(): Use to count the frequency of each element in the column
table(usedcars$year)
table(usedcars$model)
table(usedcars$color)
model_table<-table(usedcars$model)
#Use to find proportion 
prop.table(model_table)
color_pct<-table(usedcars$model)
#Use to find percentage of each category
color_pct<-prop.table(color_pct)*100
#Round of the value of one decimal place
round(color_pct,digits = 1)


df <- data.frame(
  A = c("1", "2", "three", "4", "NaN", "thirty", "7")
)
df
#substitute the missing value
df$A<-gsub("three","3",df$A)
df$A<-gsub("NaN", NA,df$A)
df$A<-gsub("thirty","30",df$A)
df$A<-as.numeric(df$A)
df

df <- data.frame(
  A = c(1, 7, NA, 4, 8),
  B = c(NA, 2, 3, NA, 5),
  C = c(10, 22, 33, NA, 58)
)
missing<-colSums(is.na(df))
missing
# For replacing NA with mean
df$A[is.na(df$A)]<-mean(df$A, na.rm=TRUE)
df$B[is.na(df$B)]<-mean(df$B,na.rm=TRUE)
df$C[is.na(df$C)]<-mean(df$C,na.rm=TRUE)
df

# for replacing NA with median
df$A[is.na(df$A)]<-median(df$A,na.rm=TRUE)
df$B[is.na(df$B)]<-median(df$B,na.rm=TRUE)
df$C[is.na(df$C)]<-median(df$C,na.rm=TRUE)
df




