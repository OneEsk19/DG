### Using subsetting to work from indexes


doggos <- read.csv("dogage.csv")



var1 <- doggos[ which(doggos$indexall=='20 Years'), ]
var1
var2 <- var1$human_years

print(paste("Your dog is", var2, "human years old!"))
      