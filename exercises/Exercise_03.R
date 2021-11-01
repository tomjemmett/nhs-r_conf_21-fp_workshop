# Exercise 3: create a plot function

library(tidyverse)
library(NHSRdatasets)

# Let's inspect the ae_attendances dataset
ae_attendances

# This dataset contains one 1 row per combindation of:
#  * month (period)
#  * organisation (org_code)
#  * A&E department type (type)

# Let's create a plot that shows the attendances over time, we will need to
# summarise our data to have just 1 row per month, e.g. with
# ae_df <- ae_attendances %>%
#   group_by(period) %>%
#   summarise(across(attendances, sum))

# ggplot(ae_df, aes(period, attendances)) +
#   geom_line() +
#   geom_point() +
#   labs(title = "A&E Attendances")

# this isn't the best plot ever, but it will do for now! :-)

# Now, suppose we want to be able to create multiple different versions of this
# plot, say for specific organisations, or just type 1 departments.
# We could of course copy the summary and plot code over and over, but we want
# to stick to the Don't Repeat Yourself (DRY) style of code, so let's create
# a function that takes in a version of the ae_attendances dataset (whether it
# is the whole dataset or a filtered version), re-runs our summary, and then
# creates a plot of the summarise data.
# This function should have two arguments, 1 should be "data" for the
# ae_attendances dataframe that we are using, and 1 should be "title", which we
# will use to label our plot

ae_attendances_plot <- function(data, title) {
  ##############################################################################
  # your code here
  ##############################################################################
}

# you can now try to see if your function generates a plot

ae_attendances %>%
  ae_attendances_plot("A&E Attendances")

ae_attendances %>%
  filter(type == "1") %>%
  ae_attendances_plot("A&E Attendances (Type 1 only)")

ae_attendances %>%
  filter(org_code == "RF4") %>%
  ae_attendances_plot("A&E Attendances (RF4 only)")
