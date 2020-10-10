# Tyler Sharretts
# Week 03: Time Series with R

# Example of nested for loops
numbersList = seq(from=1,to=3,by=1)
lettersList = list("A","B", "C")

for (num in numbersList){
  for (let in lettersList){
    print(c(num,let))
  }
}