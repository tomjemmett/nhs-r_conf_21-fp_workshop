# Exercise 4: using map

library(tidyverse)

# let's recreate my_function from Exercise 1

my_function <- function(x) {
  3 * x + 1
}

# create a vector of numbers
my_values <- YOUR_CODE_HERE

# try using map with the vector of values you created

# try map_dbl, how are the results different?

# what happens when you run my_function with a vector of values instead of a
# single value?

# try using map/map_dbl with a formula instead of the function
# ~ 3 * .x + 1
# (note that this argument is dot x)
