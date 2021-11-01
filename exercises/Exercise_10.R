# Exercise 10: rendering rmd multiple times

# in this exercise we will render a rmarkdown document multiple times, changing
# the parameters to give us different outputs

library(tidyverse)
library(rmarkdown)

# let's create a directory to store the files in
if (!dir.exists("reports")) dir.create("reports")

# have a look at the file "ae_report.Rmd". in the header there is a "param"
# called "org_code". param's are similar to parameters in SSRS reports. in this
# case they are used to filter the data in the report at runtime.

# it's possible to generate R markdown documents without using the RStudio GUI:
# the render function allows you to specify an input document, the output format,
# output filename and more.

# for example, if we want to generate the document using the default parameter
# and save a word document version to the file reports/all.docx we can call:

# render("ae_report.Rmd",
#        output_format = "word_document",
#        output_file = "reports/all.docx")

# let's get a list of org codes to generate our reports for

org_codes <- ae_attendances %>%
  group_by(org_code) %>%
  filter(sum(type == 1) == 36) %>%
  pull(org_code) %>%
  as.character() %>%
  unique() %>%
  # only take the top 10 values otherwise it will take ages to run!
  head(10)

org_codes

# now, create a function called render_report. inside this function, create
# a variable called filename.
# then, call the render function: use the sample code above, but change the
# output_file as required, and set the parameters: you will need to create
# a list with an item called "org_code" [ list(org_code = value) ]

render_report <- function(org_code) {
  # filename's should be reports/org_code.docx
  filename <- YOUR_CODE_HERE
  # now, use the render function to generate the report
  YOUR_CODE_HERE
}

walk(org_codes, render_report)
