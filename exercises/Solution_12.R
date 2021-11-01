# Solution 12: composition

library(tidyverse)
library(NHSRdatasets)
library(glue)
library(broom)

df <- ae_attendances %>%
  group_by(period) %>%
  summarise(across(where(is.numeric), sum), .groups = "drop")

df.cols <- df %>%
  select(-attendances) %>%
  colnames() %>%
  set_names()

my_lm <- compose(
  broom::tidy,
  partial(lm, data = ae_attendances),
  as.formula,
  ~glue::glue("attendances ~ {.x}")
)

map_dfr(df.cols, my_lm, .id = "column")
