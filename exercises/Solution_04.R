# Solution 4: using map

library(tidyverse)

# let's recreate my_function from Exercise 1

my_function <- function(x) {
  3 * x + 1
}

# create a vector of numbers
vals <- 1:10
# or
# vals <- seq(1, 10, 1)
# vals <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# returns a list
map(vals, my_function)

# returns a vector of numerics
map_dbl(vals, my_function)

# returns the same results - many operations (especially basic arithmetic) in R
# are vectorised by default, so in this case we really don't need map
my_function(vals)

# using the formula syntax:
# start with a ~
# then the value that is being mapped over is the variable .x
map_dbl(vals, ~ 3 * .x + 1)
