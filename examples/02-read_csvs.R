library(tidyversse)
# Read csv files example

# the data/ae_attendances folder contains csv's with identical structures, one file per month.
# we can map over the files and read each file in, combining the results into a single dataframe.

# first, get the names of the files. We will set the names of the files using the set_names
files <- dir("data/ae_attendances/", "*.csv", full.names = TRUE) %>%
  # for those not familiar with regular expressions, this is looking for a pattern of 4 digits (\\d), followed by a -,
  # then followed by two numbers, another -, and finally two more numbers. We "extract" this part of the string and use
  # that as the name of the item in the list
  set_names(function(.x) stringr::str_extract(.x, "\\d{4}-\\d{2}-\\d{2}"))

# as.list makes the results a little easier to view when printing
as.list(files)

# we can now map over the files and call read_csv
# we use the name of each item in the list to create the "period" column
ae_attendances <- map_dfr(files, read_csv, col_types = "ccddd", .id = "period")
ae_attendances

# the period column is currently a character, it would be quite useful to convert this to a date.
# We can use the mutate in a functional programming way with the across function
ae_attendances %>%
  mutate(across(period, as.Date))
# contrast this to writing out mutate(period = as.Date(period)), the functional style reduces the risk for creating a
# bug by accidentally creating a new column (mutate(Period = as.Date(period))), or using the wrong column
# (mutate(period = as.Date(Period)))

# the big benefit of across is being able to apply a function across multiple columns, e.g.

ae_attendances %>%
  mutate(across(where(is.numeric), rescale_01))
