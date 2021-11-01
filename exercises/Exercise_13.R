# Exercise 13: safely/possibly

library(tidyverse)

# let's recreate exercise 6, but use a fixed list of files.

files <- c("data/ae_attendances/2019-01-01.csv",
           "data/ae_attendances/2019-02-01.csv",
           "data/ae_attendances/2019-03-01.csv",
           "data/ae_attendances/2019-04-01.csv") %>%
  set_names(\(x) str_extract(x, "\\d{4}-\\d{2}-\\d{2}"))

# note that the last file does not exist
file.exists(files)

# now, first try running the following:
map(files, read_csv, col_types = "ccddd")

# because the last file doesn't exist, the whole thing errors.

# try to fix the above line with safely

res <- YOUR_CODE_HERE

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

# if we don't care for errors, or we have a sensible default value, we could use
# the possibly function instead (hint, bind_rows(df, NULL) <==> df)

map_dfr(files, YOUR_CODE_HERE, col_types = "ccddd")
