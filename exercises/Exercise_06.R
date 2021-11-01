# Exercise 6: loading a folder of csv's

library(tidyverse)

# read in multiple csv's from a folder and combine into a single dataframe

# there are a bunch of csv's in the folder data/ae_attendances. These files
# all have the same structure, so could be combined by loading each file
# individually and joining the rows by using "bind_rows" (which is basically
# Sql UNION)

# but we could take advantage of map_dfr if we can first get a list of the files
# we can use the "dir" function to get a list of all files in a directory. In
# this case we need to provide a "pattern" to just filter the list to csv files,
# the pattern is going to be a regular expression ("\\.csv$").
# We also want to set the full.names argument to TRUE: if we don't then it will
# just return the names of the files and not which folder the files are in

# first use the "dir" function to get the list of files that we want to load.
# the path argument needs to be set to the directory that contains our files,
# in this case "data/ae_attendances". save the output of this function to a
# variable called files
# (view the help for this function by typing ?dir into the console.)

files <- YOUR_CODE_HERE

# if you open one of the files you will see the data does not contain the
# "period" (date) that the data relates to. Instead, this data comes from the
# filename.
read_csv(files[[1]])

# use set_names() to convert the files vector to a named vector. The second
# argument of set_names() can be a function, to extract the date part we could
# use a regular expression
#   \(x) str_extract(x, "\\d{4}-\\d{2}-\\{d}")
files <- YOUR_CODE_HERE

# now, we want to read in all of these csv's using the read_csv function from
# the readr package (part of tidyverse). read_csv will guess what column types
# your csv contains. if you leave read_csv to guess the column types it will
# print to the screen the column types used.
# if we read the first of our files (files[[1]]), and then pass the data frame
# into the spec() function we will get the complete column spec as an object
# that can then be passed to future read_csv calls to ensure that we load all of
# the files in a consistent manner. try using read_csv with files[[1]], and
# pipping the results to the spec funciton, and save the results to a variable
# called col_types

col_types <- YOUR_CODE_HERE

# Note that read_csv has output some messages to the console about the column
# spec that was used to read in the csv. if you view the col_types variable it
# should look the same!

# now, you can do something like read_csv(filename, col_types = col_types). this
# time read_csv won't report what column spec was used.

# now we can use map_dfr along with the files list and the read_csv function.
# see if you can see how to pass the col_types = col_types argument to the each
# of the read_csv function calls. assing this to a variable called my_ae_attendances

my_ae_attendances <- YOUR_CODE_HERE


# you should see that the unique number of months in the my_ae_attendances
# dataframe are the same as the number of files in the directory
length(unique(my_ae_attendances$period))
length(files)


# This approach can also be applied to excel files, by using the read_excel
# function from readxl. If the data is stored in a sheet called "data" in
# each file you can do something like
#   map_dfr(xl_files, read_excel, sheet = "data")
# if instead you have a file called "file.xlsx" and you want to read in every
# sheet in the file you could try:
#   sheets <- excel_sheets(xl_file)
#   map_dfr(sheets, ~read_excel(xl_file, sheet = .x))
# here we have created an anonymous function that varies the sheet argument
# with the variable ".x" which would be the value for all of the items in sheets
