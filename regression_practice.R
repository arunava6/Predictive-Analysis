house_data<- data.frame(
  size_sqft= c(1500,1800,2000,2200,2500,3000,3500,4000,4500,5000),
  Bedrooms=c(3,3,4,4,5,5,5,6,6,6),
  Bathrooms=c(2,2,3,3,4,4,3,5,4,5),
  Age_years=c(10,5,8,12,6,3,15,7,4,2),
  Price=c(300000,350000,400000,420000,500000,600000,620000,700000,800000,820000)
)
View(house_data)
relation<-lm(Price~size_sqft+Bedrooms+Bathrooms+Age_years,data=house_data)
summary(relation)

new_house<-data.frame(size_sqft=2000,Bedrooms=5,Bathrooms=5,Age_years=8)
result<-predict(relation,new_house)
cat("Predicting price is: ",result)








salary_data<-data.frame(
  experience=c(1,2,3,4,5,6,7,8,9,10),
  education=c(12,14,16,14,12,14,14,16,13,15),
  age=c(21,25,24,20,24,23,21,22,30,28),
  salary=c(50,55,60,62,58,65,70,72,75,66)
)
View(salary_data)
data_model<-lm(salary~experience+education+age,data=salary_data)
summary(data_model)
new_data<-data.frame(experience=11,education=17,age=26)
result<-predict(data_model,new_data)
cat("Predicted salary of a person in dollars: $",result)









val<-read.csv(file.choose(),stringsAsFactors = FALSE)
View(val)
summary(val$charges)
plot(val)
str(val)
hist(val$age)

# cor() is used to find the correlation between two variable
cor(val[c("age","bmi","children","charges")])

# pairs(): A matrix of scatterplots is produced.
pairs(val[c("age","bmi","children","charges")])


#psych library is used to visualize the pair plot in better way
library(psych)
# an enhanced scatterplot panel is created with the pairs
pairs.panels(val[c("age","bmi","children","charges")])

ins_model<-lm(charges~ age+children+sex+bmi+smoker+region,data=val)
new_model<-data.frame(age=45,children=2,sex="female",bmi=35.87,smoker="no",region="northeast")
result<-predict(ins_model,new_model)
cat("The predicting charges for above category is: ₹",result)

# using val$bmi30, we can change the create a new column on dataset with the following condition
val$bmi30<- ifelse(val$bmi>30,1,0)
val$bmi30
ins_model2<-lm(charges~age+children+sex+bmi+smoker+region+bmi30,data=val)
summary(ins_model2)





