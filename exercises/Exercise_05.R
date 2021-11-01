# Exercise 5: using map with a dataframe

# let's reimplement exercise_02 using a map function

library(tidyverse)

set.seed(20211102)

df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

rescale_01 <- function(x) {
  x_range <- range(x, na.rm = TRUE)
  (x - x_range[[1]]) / diff(x_range)
}

# try using map, with the data frame as the first argument, and rescale_01 as the
# second argument

# try using map_dfr instead of map
