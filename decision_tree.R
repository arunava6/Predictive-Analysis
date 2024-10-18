iris
View(iris)
library(rpart)      # for creating decision tree
str(iris)

# this randomly selects 110rows(observations) from the 150 total rows
indexes=sample(150,110)
indexes
#This creates the training set by picking the 110 randomly selected rows 
iris_train<- iris[indexes,]
iris_train

#This creates the test set with remaining 40 rows that weren't selected for training
iris_test<-iris[-indexes,]
iris_test

#This tells R what we want to predict (the flower species) based on the flower's featurs
target=Species ~ Petal.Length+ Petal.Width
target

#This command creates a decision tree using the training data aiming to classify the species
tree<- rpart(target,data=iris_train,method="class")

library(rpart.plot)
#This displays the decision tree, helping you understand how the tree makes decision to 
# classify the species
rpart.plot(tree)

#This command uses the decision tree to predict the species of the flowers in the test set
# (the 40 rows not used for training)
predictions<-predict(tree,iris_test)
predictions
