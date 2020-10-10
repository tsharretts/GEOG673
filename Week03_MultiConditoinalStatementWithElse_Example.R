# Tyler Sharretts
# Week 03: Time Series with R

# Multi-conditional statement with an else
numbersList = seq(from=1,to=3,by=1)
lettersList = list("A","B", "C")

for (num in numbersList){
  for (let in lettersList){
    if(num == 3 && let == "B"){
      print(c(num,let))
    } else{
      print("Not what we want")
    }
  }
}