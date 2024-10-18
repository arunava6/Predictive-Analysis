
var<-read.csv(file.choose())
View(var)
str(var)
var$Salary<-as.numeric(var$Salary)
var$Survey_Score<-gsub("four","4",var$Survey_Score)
var$Survey_Score<-as.numeric(var$Survey_Score)
a<-colSums(is.na(var))
a
var$Age[is.na(var$Age)]<-mean(var$Age,na.rm=TRUE)
var$Salary[is.na(var$Salary)]<-mean(var$Salary,na.rm=TRUE)
var$Survey_Score[is.na(var$Survey_Score)]<-mean(var$Survey_Score,na.rm=TRUE)
var


var$Age[is.na(var$Age)]<-median(var$Age,na.rm=TRUE)
var$Salary[is.na(var$Salary)]<-median(var$Salary,na.rm=TRUE)
var$Survey_Score[is.na(var$Survey_Score)]<-median(var$Survey_Score,na.rm=TRUE)
var







library(ggplot2)
df<-diamonds
View(df)
str(df)
normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
df_n<-as.data.frame(lapply(df[5:10],normalize))
df_n$cut<-as.factor(df$cut)
train_df<-df_n[1:27000,]
test_df<-df_n[27001:53940,]
train_data_labels<-train_df$cut
test_data_labels<-test_df$cut
library(class)
pred <- knn(train = train_df, test = test_df, cl = train_data_labels, k = 232)
library(gmodels)
CrossTable(x=test_data_labels,y=pred)
accuracy<-mean(test_data_labels==pred)
result<-round(accuracy *100,digits = 2)
result






library(sqldf)
data<-airquality
View(data)
sqldf("select Ozone,Temp from data where Month=7")
sqldf("select Month,avg(Wind) as average_wind from data group by Month")
sqldf("select count(Day) from data where Ozone>100")
sqldf("select Month,avg(Temp) as average_temp from data where Wind>10 group by Month")





