# Solution 5: using map with a dataframe

library(tidyverse)

set.seed(20211102)

df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

rescale <- function(x) {
  x_range <- range(x, na.rm = TRUE)
  (x - x_range[[1]]) / diff(x_range)
}

# map returns a list, with an entry for each of the columns in df. The list
# entries have the same names as the columns from the data frame. In each
# case, the list values are numeric vectors the same length as the number of
# rows from df
map(df, rescale)

# map_dfr returns a dataframe: this is probably the result that you want
map_dfr(df, rescale)

################################################################################
# Side note:
################################################################################

# there are 2 variants of map that are for combining dataframes:
# map_dfr and map_dfc

# map_dfr is used when your function returns a dataframe, and you want to
# combine the results rowwise (like a UNION in Sql). map_df is the same
# as map_dfr

# Result 1:
# A B C
# 1 2 3
# 2 3 4
# 3 4 5

# Result 2:
# A B
# 4 5
# 5 6

# becomes
# A B C
# 1 2 3
# 2 3 4
# 3 4 5
# 4 5 NA
# 5 6 NA

list(
  tibble(A = 1:3, B = 2:4, C = 3:5),
  tibble(A = 4:5, B = 5:6)
) %>%
  # identity is f(x) x, that is it returns the input unchanged
  map_dfr(identity)
# try changing dfr to dfc

# map_dfc is used when your function returns a dataframe, and you want to
# combine the results columnwise

# Result 1
# A B
# 1 2
# 2 3
# 3 4
# 4 5
# 5 6

# Result 2
# C
# 3
# 4
# 5
# 6
# 7

# becomes
# A B C
# 1 2 3
# 2 3 4
# 3 4 5
# 4 5 6
# 5 6 7

list(
  tibble(A = 1:5, B = 2:6),
  tibble(C = 3:7)
) %>%
  map_dfc(identity)
# try changing dfc to dfr, try changing C = 3:7 to 3:6
# try changing dfc to df

# now, sort of confusingly... if your use map with a list (or a data frame,
# it will sort of convert it to a list with an entry for each column) and
# the function returns a vector with an equal number of entries for each input,
# then map_dfr and map_dfc will return exactly the same... so in our previous
# example, we could change map_dfr to map_dfc
map_dfc(df, rescale)

