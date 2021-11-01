# Exercise 10: rendering rmd multiple times

library(tidyverse)
library(NHSRdatasets)
library(rmarkdown)

if (!dir.exists("reports")) dir.create("reports")

org_codes <- ae_attendances %>%
  group_by(org_code) %>%
  filter(sum(type == 1) == 36) %>%
  pull(org_code) %>%
  as.character() %>%
  unique() %>%
  head(10)

render_report <- function(org_code) {
  filename <- glue::glue("reports/{org_code}.docx")

  render("ae_report.Rmd",
         output_format = "word_document",
         output_file = filename,
         params = list( org_code = org_code ))
}

walk(org_codes, render_report)
