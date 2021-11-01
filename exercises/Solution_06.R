# Solution 6: loading a folder of csv's

library(tidyverse)

# part 1: get the list of files
files <- dir("data/ae_attendances", pattern = "\\.csv$", full.names = TRUE)

# part 2: set the names of the files
files <- set_names(files, \(x) str_extract(x, "\\d{4}-\\d{2}-\\d{2}"))

# part 3: get the column spec
col_types <- read_csv(files[[1]]) %>% spec()

# part 4: read in the files
# the ... argument of the map functions are passed directly to the mapped
# function, so with the below code we get
#   read_csv(files[[i]], col_types = col_types)
my_ae_attendances <- map_dfr(files, read_csv, col_types = col_types, .id = "period")

# view the data
my_ae_attendances

# verify that the number of files = the number of months loaded
length(unique(my_ae_attendances$period)) == length(files)
