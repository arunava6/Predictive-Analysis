vec1<- c("Ram","Shyam","Raju")
vec2<- c(10L,20L,30L)
vec3<-c(TRUE,FALSE,FALSE)
typeof(vec1)
class(vec1)
typeof(vec2)
class(vec2)
typeof(vec3)
class(vec3)


sub<- factor(c("Science","Math","English"),levels = c("Science","History","Geography","Math","English"))
sub

a<-factor(vec1)
a


list1<-list(c(1,2,3,4),c("Hello","Hi","Good"),c(12.01,13.65,25.9),c(TRUE,FALSE,TRUE))
list1


var1<-data.frame(Roll=c(1,2,3),
                 Name=c("Subroto","Arunava","Vaibhav"),
                 Marks=c(28,29,27))
var1
str(var1)
names(var1)


matrix1<- matrix(c(1:12),nrow=3,byrow=FALSE,dimnames=list(c("row1","row2","row3"),c("col1","col2","col3","col4")))
matrix1

matrix1[3]
matrix1[3,2]
matrix1[2,]
matrix1[,3]
matrix1[1:3,1:2]
matrix1[3:6]
matrix1[,1:3]




vec1<-c(1,2,3,4)
vec2<-c(10,20,30,40)
array1<-array(c(vec1,vec2))     # 1D array
array2<-array(c(vec1,vec2),dim = c(2,4))   #2D array
array1
array2

a<-array(c(1:24),dim=c(3,4,2))  #More than two dimensions
a


25+4
25-4
25*4
25/4
25%%4
25^4
25%/%4



1&1
1&0
1|0
1&&0
1||0

a=5
a<-10
20->a
a<<-4
30->>a


8%in%c(1,2,3,4)
2%in%c(1,2,3,4,5)



