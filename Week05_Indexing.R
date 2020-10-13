# Tyler Sharretts 
# Week 05: Rewriting, Reprojecting, & Resampling Rasters 

### Indexing (touhcing base on one more essential skill)


matA <- matrix(1:16, 4, 4)

matA

# Obtaining the value from the 2nd row, 3rd column 
matA[2,3]

# Obtaining specific grid cells (points from 1st row, 3rd columm & 2nd row, 4th column)
matA[c(1,3), c(2,4)]

# We can also just sub-select rows 1 through 3 & columns 2 through 4
matA[1:3,2:4]

# Sub-selecting rows 1 through 3 and all columns 
matA[1:3,]

# Or if we want to sub-select all rows for columns 1 through 3 
matA[,1:3]