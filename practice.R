var<-CO2
View(var)
table(var$Type)
table(var$Treatment)
table(var[c("Type","Treatment")])
name1<-table(var$Plant)
perc<-prop.table(name1)*100
round(perc,digits=2)


df<-mtcars
View(df)
str(df)
normalize<- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}
df_n<- as.data.frame(lapply(df,normalize))
df_n$vs <- as.factor(df$vs)
df_train<- df_n[1:16,]
df_test<-df_n[17:32,]
df_train_labels<- df_train$vs
df_test_labels<-df_test$vs
df_test_pred<- knn(train =df_train,test=df_test,cl=df_train_labels,k=5)
CrossTable(x=df_test_labels,y=df_test_pred)
# Calculate accuracy manually
accuracy <- mean(df_test_labels == df_test_pred)
print(paste("Accuracy: ", round(accuracy * 100,digits = 2), "%", sep = ""))


library(sqldf)
df<-airquality
View(df)
sqldf("Select Ozone,Temp from df where month=7")
sqldf("select Month, avg(Wind) as average from df group by Month")
sqldf("select count(Day) as count from df where Ozone>100")
sqldf("select Month, avg(Temp) as average from df where Wind>10 group by Month")



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


data<-ToothGrowth
View(data)
sqldf("select len,supp from data where dose=2")
sqldf("select supp , avg(len) as average from data group by supp")
sqldf("select supp,avg(len) as average from data where dose>1 group by supp")



data<-mtcars
View(data)
str(data)
normalize<-function(x){
  return((x-min(x))/(max(x)-min(x)))
}
data_n<-as.data.frame(lapply(data,normalize))
data_n$am<-as.factor(data$am)
data_train<-data_n[1:25,]
data_test<-data_n[26:32,]
data_train_labels<-data_train$am
data_test_labels<-data_test$am
data_pred<-knn(train=data_train,test=data_test,cl=data_train_labels,k=5)
accuracy<-mean(data_test_labels==data_pred)
result<-round(accuracy*100, digits = 2)
result
CrossTable(x=data_test_labels,y=data_pred)

