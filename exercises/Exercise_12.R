# Exercise 12: composition

library(tidyverse)
library(NHSRdatasets)
library(glue)
library(broom)

# compose can make a new function by chaining two or more functions together.

# in exercise 1 we created a function that did 3*x + 1, this could be expressed
# as two individual functions, one that does 3*x, then one that does x+1
# note that compose is like mathematics: the functions are evaluated "backwards"

compose(~.x + 1, ~3 * .x)(3)

# the result is different from

compose(~3 * .x, ~.x + 1)(3)

# but you can "reverse" the direction like so:

compose(~3 * .x, ~.x + 1, .dir = "forward")(3)
# (default .dir is "backward")

# composostion can be used to make useful functions, like a "not in"

`%nin%` <- compose(`!`, `%in%`)

1 %in% 1:3
1 %nin% 1:3

# (aside: purrr also has negate, so we could do `%nin%` <- negate(`%in%`))

# it's very common to need to chain multiple functions together.
# below, let's fit a linear regression model to the ae_attendances dataset, but
# first let's group the dataframe by month and sum the numeric columns

df <- ae_attendances %>%
  group_by(period) %>%
  summarise(across(where(is.numeric), sum), .groups = "drop")

# let's try to predict the attendances column based on the other columns in the
# dataframe, so let's select all but the attendances column, get the column
# names, and then let's set the names for each item in the vector (to be the
# same as the vector item, this will become clearer later...)
df.cols <- df %>%
  select(-attendances) %>%
  colnames() %>%
  set_names()

df.cols

# now, lets take these columns, create a string that can then be converted to a
# formula, call the lm function against these formula's (setting the data arg to
# be our dataframe), then finally use broom::tidy function to neaten the results
# (note, that by setting the .id argument with map_dfr, it will take the list
# items name (which we set above with set_names) and assign it to a column)
df.cols %>%
  map(~glue::glue("attendances ~ {.x}")) %>%
  map(as.formula) %>%
  map(lm, data = df) %>%
  map_dfr(broom::tidy, .id = "column")

# now, using multiple maps is messy. we could rewrite this using compose
# try this below
# (hint: we cannot pass data = df in the ... argument of map, as this will only
# be passed to the first function in the compose chain. we will instead need to
# use partial here: partial(lm, data = df), but .id is an argument for map_dfr
# so we don't need to use partial for this function)

my_lm <- YOUR_CODE_HERE

my_lm <- compose(
  broom::tidy,
  partial(lm, data = ae_attendances),
  as.formula,
  ~glue::glue("attendances ~ {.x}")
)

map_dfr(df.cols, my_lm, .id = "column")

