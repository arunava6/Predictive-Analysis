
var<- data.frame(Roll=c(10,20,30),
                 Name=c("Arunava","Subroto","Vishal"),
                 Course=c("Cse","Agriculture","MBA"))
var

save(var,file="practice.RData")
getwd()
file<-ls()
file
var
rm("blood")
rm("add")
getwd()
#setwd("D:/new")
load("practice.RData")


