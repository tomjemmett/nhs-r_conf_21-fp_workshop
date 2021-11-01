# Solution 13: safely/possibly

library(tidyverse)

files <- c("data/ae_attendances/2019-01-01.csv",
           "data/ae_attendances/2019-02-01.csv",
           "data/ae_attendances/2019-03-01.csv",
           "data/ae_attendances/2019-04-01.csv") %>%
  set_names(\(x) str_extract(x, "\\d{4}-\\d{2}-\\d{2}"))

res <- map(files, safely(read_csv), col_types = "ccddd")

# show the errors
res %>%
  discard(~is.null(.x$error)) %>%
  # if we are mapping over a list of named lists, we can select an item by name
  # like so:
  map("error")

# show the results
res %>%
  keep(~is.null(.x$error)) %>%
  # like above, but as our "result" items are dataframes we can use the map_dfr
  # function to return a single dataframe
  map_dfr("result", .id = "period")

# or, with possibly
map_dfr(files, possibly(read_csv, NULL), col_types = "ccddd", .id = "period")
