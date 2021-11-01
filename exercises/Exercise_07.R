# Exercise 7: map2 to get rowwise minimum values

library(tidyverse)

# set a seed so we get the same random numbers
set.seed(1425)

# generate a simple dataset containing two columns that contain 10 rows with two
# columns, each column with have all of the numbers from 1 to 10 once
df <- tibble(x = sample(1:10, 10),
             y = sample(1:10, 10))

# lets have a quick look at the table
df

# Let's try to find the minimum value in each row using the min function:

df %>%
  mutate(min = min(x, y))

# does this look right? mutate passes both of the complete lists to min, and min
# finds the smallest value in all of the input's.

# There are a couple of solutions to this problem:
# 1) introduce an index column (using row_number() for example). Then, use the
#    pivot_longer/pivot_wider functions

df %>%
  mutate(.id = row_number()) %>%
  pivot_longer(cols = c(x, y)) %>%
  group_by(.id) %>%
  mutate(min = min(value)) %>%
  pivot_wider(names_from = name,
              values_from = value) %>%
  ungroup() %>%
  select(x, y, min)

# 2) use the rowwise() function to introduce a grouping by row

df %>%
  rowwise() %>%
  mutate(min = min(x, y))

# both of these methods are a bit messy, 1 takes way too many lines of code, and
# 2 requires you to regroup your data - this could be a problem if you have some
# existing groupings that you wish to keep!

# now, try to use the map2 function to find the min values per row. You can use
# map functions inside of a mutate() to create a new column.
# (hint: map2 has all of the same _xyz variants that map has)
