### Cars - Motor Trends Magazine Data

# load cars data set
data("mtcars")

# finding out the headings of the cars data set
head(mtcars)

# finding the class of the cars data set
class(mtcars)

# finding the dimensions of the cars data set
dim(mtcars)

#finding the number of rows and columns of the cars dat set
nrow(mtcars)
ncol(mtcars)

# finding the names of the rows and columns of the cars data set
rownames(mtcars)
colnames(mtcars)

# extracting the miles per gallon (mpg) column/variable from the cars data set
mtcars["mpg"]

#extracting the mpg data vector 
mtcars$mpg

# statistics of the cars data set
summary(mtcars)

# looking at the first 5 cars of the cars data set
mtcars[1:5,]

# indexing the first five rows of the first column
mtcars[1:5,1]

# barplotting mpg for the first 5 five cars
barplot(height = mtcars$mpg[1:5], names.arg = rownames(mtcars)[1:5])

