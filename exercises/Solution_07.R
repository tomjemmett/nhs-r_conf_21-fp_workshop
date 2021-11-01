# Solution 7: map2 to get rowwise minimum values

library(tidyverse)

# set a seed so we get the same random numbers
set.seed(1425)

# generate a simple dataset containing two columns that contain 10 rows with two
# columns, each column with have all of the numbers from 1 to 10 once
df <- tibble(x = sample(1:10, 10),
             y = sample(1:10, 10))

df %>%
  mutate(min = map2_dbl(x, y, min))
