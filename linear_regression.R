# Height predictor vector
x<-c(5.1,5.5,5.8,6.1,6.4,6.7,6.4,6.9,5.3,6.5)

# Weight response vector
y<-c(63,66,69,72,75,78,75,72,69,70)

length(x)
length(y)
#lm() : this function is used to fit linear regression   . lm() stands for Linear Model
relation<-lm(y~x)       # y is dependent and x is independent. Here, we determine regression of y based on x
summary(relation)

#find weight of a person with given height
a<- data.frame(x=6.9)
result<-predict(relation,a)
result









val<-read.csv(file.choose(),stringsAsFactors = FALSE)
View(val)

#Selecting the relevent column
val<-val[,2:3]

#splitting the datasets into training and test set
library(caTools)
set.seed(123)
split<- sample.split(val$Salary,SplitRatio = 0.65)    #Splitratio use for telling how much percentage of data we use for training
training_set<-subset(val,split==TRUE)
training_set
test_set<-subset(val,split==FALSE)
test_set

library(rpart)
regressor<-rpart(Salary ~ .,
                 data=training_set,
                 control=rpart.control(minsplit =2,cp=0.01))   #cp is complexity parameter
regressor

#predicting result on test set
y_pred<-predict(regressor,newdata=test_set)
y_pred

library(rpart.plot)
rpart.plot(regressor)

library(ggplot2)
x_grid<- seq(min(val$Level),max(val$Level),0.0)
ggplot()+
  geom_point(aes(x=val$Level,y=val$Salary),color="red")+
  geom_line(aes(x=x_grid,y=predict(regressor,newdata = data.frame(Level = x_grid))),color="blue")+
  ggtitle("Truth or Bluff (Decision Tree Regression)")+
  xlab('Level')+
  ylab('Salary')

