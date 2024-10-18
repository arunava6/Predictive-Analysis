
library(sqldf)
mtcars
sqldf("select * from mtcars where gear = 4")
sqldf("select mpg,cyl from mtcars where gear<5")
sqldf("select mpg,cyl,gear from mtcars where gear<4")

iris
head(iris)
df<- sqldf("select [Sepal.Width] as Sepalwidth,species from iris")
View (df)
sqldf("select species from iris where [Sepal.Length] <6")
df<- sqldf("select [Sepal.Width] as Sepalwidth, species from iris limit 2")
View(df)
sqldf("select [Sepal.Width] from iris order by [Sepal.Width]asc")

df<- sqldf("select max([Sepal.Length]) as MaxSepalLength,Species from iris")
View(df)
sqldf("Select sum([Sepal.Length]) as sumSepalLength,species from iris group by Species")
sqldf("select avg([Sepal.Length]) as average, Species from iris group by Species")

#insert data using sqldf
d<- data.frame(a=c('a','b','c'),b=c(1,3,1))
View(d)
d<-sqldf(c("insert into d values('x',999)","Select * from d"))
d

#update data using sqldf
d<-data.frame(a=c('a','b','c'),b=c(1,3,1))
d<-sqldf(c("update d set a='yyy',b=111 where a='a' ","select * from d"))
d

#delete data using sqldf
d<-sqldf(c("delete from d where a='yyy' ","select * from d"))
d

