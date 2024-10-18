data<-read.csv(file.choose(),stringsAsFactors = FALSE)
View(data)
summary(data)
str(data)
hist(data$strength,col = "Orange",border="white",xlab = "Strength",ylab = "Frequency",main="Strength graph")
# apply normalize func() to make the value between the range 0-1
normalize<- function(x){
  return ((x-min(x))/(max(x)-min(x)))
}
data_n<-as.data.frame(lapply(data[1:9],normalize))
View(data_n)
summary(data_n$strength)
data_train<-data_n[1:773,]
data_test<-data_n[774:1030,]
# package for implement neural network
library("neuralnet")
data_model<-neuralnet(strength ~ cement+slag+ash+ water+superplasticizer
                      +coarseagg+fineagg+age,data= data_train,hidden=5)

plot(data_model)

model_result<-compute(data_model,data_test[1:8])
predict_strength<-model_result$net.result
cor(predict_strength,data_test$strength)

