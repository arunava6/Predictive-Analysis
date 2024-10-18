data1<-read.csv(file.choose(),stringsAsFactors = FALSE)
View(data1)
data1[2:3]

# lin_reg is a linear regression model
lin_reg=lm(Salary~Level,data=data1)
summary(lin_reg)
data1$Level2<-data1$Level^2
data1$Level3<-data1$Level^3
data1$Level4<-data1$Level^4
View(data1)
#poly_reg is polynomoial regression model
poly_reg<-lm(Salary~ Level+Level2+Level3+Level4 ,data=data1)
summary(poly_reg)

library(ggplot2)
# This line chart is visualize the Linear regression of the dataset 
ggplot()+
  geom_point(aes(x=data1$Level,y=data1$Salary),color="red")+
  geom_line(aes(x=data1$Level,y=predict(lin_reg,newdata = data1)),color="blue")+
  ggtitle("Linear regression")+
  xlab('Level')+
  ylab('Salary')

# This line chart is visualize the polynomial regression of the dataset
ggplot()+
  geom_point(aes(x=data1$Level,y=data1$Salary),color="red")+
  geom_line(aes(x=data1$Level,y=predict(poly_reg,newdata = data1)),color="blue")+
  ggtitle("Polynomial Regression")+
  xlab("Level")+
  ylab("Salary")


