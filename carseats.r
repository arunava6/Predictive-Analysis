library(ISLR)
data<-Carseats
View(data)
str(data)
index<-sample(400,250)
library(rpart)
train_set<-data[index,]
train_set
test_set<-data[-index,]
target<-ShelveLoc ~ Price+Age
target
tree<-rpart(target,data=train_set,method = "class")
library(rpart.plot)
rpart.plot(tree)

prediction<-predict(tree,test_set)
prediction
printcp(tree)




library(ISLR)
data<-Carseats
View(data)
str(data)
#Preprocessing: create a binary outcomes variable 'New_Sales'
New_sales<- ifelse(data$Sales >= 8, "Yes","No")
data<-data.frame(data,New_sales=as.factor(New_sales))
View(data)

#Drops the original 'Sales' variable since we're predicting 'New_sales'
data<-data[,-which(names(data)=="Sales")]
View(data)

#Split the data into training and testing sets
set.seed(2)
train<-sample(1:nrow(data),nrow(data)/2)
train_data<-data[train,]
test_data<-data[-train,]
# it is used to extract the New_sales column from the testing set, which will be used later
# compare against the model's predictions for evaluation.
testingNew_Sales<- data$New_sales[-train]

# use to make decision tree same as rpart
library(tree)
tree_model<-tree(New_sales~ . ,data<-train_data,mindev=0.001)
plot(tree_model)
text(tree_model,pretty=0)    #Add labels or text annotation in the tree

tree_pred<- predict(tree_model,test_data,type = "class")

#Pruning the tree to avoid overfitting
set.seed(2)
cv_tree<-cv.tree(tree_model,FUN = prune.misclass)
#cv.tree performs cross validation on the decision tree
# to help identity the optimal size of the tree
# Prunes the tree based on misclassification error

plot(cv_tree$size, cv_tree$dev,type="b", xlab="Tree Size", ylab = "Deviance") 
# Here type 'b' stands for both point and line. type 'p' for point and 'l' for 'line'

#Prune Tree
pruned_tree<- prune.misclass(tree_model,best=9)
plot(pruned_tree)
text(pruned_tree,pretty = 0)
