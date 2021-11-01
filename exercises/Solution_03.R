# Solution: create a plot function


library(tidyverse)
library(NHSRdatasets)

# one option would be to create a new dataframe variable and use that in ggplot
ae_attendances_plot <- function(data, title) {
  ae_df <- data %>%
    group_by(period) %>%
    summarise(across(attendances, sum))

  ggplot(ae_df, aes(period, attendances)) +
    geom_line() +
    geom_point() +
    labs(title = title)
}

# or, you could also just do it in one pipe
ae_attendances_plot <- function(data, title) {
  data %>%
    group_by(period) %>%
    summarise(across(attendances, sum)) %>%

    ggplot(aes(period, attendances)) +
    geom_line() +
    geom_point() +
    labs(title = title)
}

ae_attendances %>%
  ae_attendances_plot("A&E Attendances")

ae_attendances %>%
  filter(type == "1") %>%
  ae_attendances_plot("A&E Attendances (Type 1 only)")

ae_attendances %>%
  filter(org_code == "RF4") %>%
  ae_attendances_plot("A&E Attendances (RF4 only)")
