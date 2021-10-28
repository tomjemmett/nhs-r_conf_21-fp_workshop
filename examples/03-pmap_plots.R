library(tidyverse)
library(NHSRdatasets)

# we can create nested dataframes with the nest() function, this is like running summarise(), but creates a column
# called "data" with all of the non-grouped columns
ae_types <- NHSRdatasets::ae_attendances %>%
  group_by(type, period) %>%
  summarise(across(attendances, sum), .groups = "drop_last") %>%
  nest()

ae_types

# note that the "data" column is of type list, and each item is a tibble with 36 rows and 2 columns

# we can inspect one of the nested tibbles by selecting the column and looking at the first item in the list
ae_types$data[[1]]

# we can build a function that will create a plot for each row in the nested tibble. this function will need to have
# arguments for each of the columns of data, i.e. "type" and "data"
ae_plot <- function(type, data) {
  ggplot(data, aes(period, attendances)) +
    geom_line() +
    geom_point() +
    labs(title = paste("type:", type))
}

# we can now use the pmap function to iterate over each row of data in ae_types
plots <- pmap(ae_types, ae_plot)

# we can view all three plots, use the <- and -> arrows in the rstudio plot pane to see the other plots
plots

# saving to disk is easy enough using the walk2 function: ggsave expects a filename and then a plot to save
filenames <- paste0("plots/ae_plot_type_", ae_types$type, ".png")
# we can pass additional arguments to ggsave, like plot size
walk2(filenames, plots, ggsave, width = 1920, height = 1080, units = "px")
