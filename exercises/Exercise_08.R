# Exercise 8: create plots from nested data frames

# in this exercise we will create multiple individual plots using nested
# dataframes and the pmap function.

# we will use the ae_attendances dataset from NHSRdatasets. First, we will do a
# little bit of data cleansing, basically removing organisations that don't have
# 36 months of data for their type 1 a&e department.

library(tidyverse)
library(NHSRdatasets)

num_months <- n_distinct(ae_attendances$period)

df <- ae_attendances %>%
  group_by(org_code) %>%
  # find all of the organisations that have reported type 1 attendances
  # for each of the months
  filter(sum(type == 1) == num_months) %>%
  # add in the type column to the grouping
  group_by(type, .add = TRUE) %>%
  # nest the dataframe by the groupings
  # all of the other columns become a nested dataframe in the "data" column
  nest()

df

# We've got 271 rows of data here, so to speed things up, let's only keep the
# first 10 rows
df <- head(df, 10)

# In exercise 3 we created a function that generated a plot for us, below is a
# slightly modified version of this function. Note that pmap requires the
# arguments of a function to have the exact same name as the list items (or,
# when working with a dataframe, the column names). However, the arguments do
# not need to be in the same order as they appear in the list/dataframe!
ae_attendances_plot <- function(data, org_code, type) {
  title <- paste0("AE Attendances")

  data %>%
    group_by(period) %>%
    summarise(across(attendances, sum)) %>%

    ggplot(aes(period, attendances)) +
    geom_line() +
    geom_point() +
    labs(title = "AE Attendances",
         subtitle = paste0(org_code, ": Type ", type))
}

# now, use the pmap function with the dataframe that we created above to generate
# a plot for each of rows in our nested dataframe. Save this to a variable called
# plots

plots <- YOUR_CODE_HERE

# now, show all 10 plots (use the <- / -> buttons in the plots pane to view them)
plots

# the names of these items in the plots list aren't very useful, we could use the
# set_names function and map2_chr to generate more useful names!
plots <- plots %>%
  set_names(map2_chr(df$org_code, df$type, ~paste0(.x, "_type_", .y)))

plots
