# Exercise 11: partial application

library(tidyverse)

# sometimes we have functions that we are always having to pass the same
# arguments to, for example, na.rm to mean. for example,

x <- c(1:10, NA)

# what is the mean value of this vector?
mean(x)

# we need to add the na.rm = TRUE argument to get the result we are after
mean(x, na.rm = TRUE)

# it is sometimes useful to create a new function from an old one

# we could create mean_na_rm by wrapping the function call inside another...
mean_na_rm <- function(...) {
  mean(..., na.rm = TRUE)
}

# but this is such a common problem that purrr has a function to help us: partial
# try rewritting mean_na_rm with partial
mean_na_rm <- YOUR_CODE_HERE

mean_na_rm(x)
