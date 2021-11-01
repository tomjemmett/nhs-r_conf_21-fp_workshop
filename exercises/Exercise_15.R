# Exercise 15: some/every/none

# base R comes with the all() and any() functions which take a logical vector
# and return a single TRUE or FALSE value, e.g.

values <- 1:9
x <- values > 5
x

any(x)
all(x)

any(x[1:5])
all(x[6:9])

# the some/every functions from purrr are generalised versions of these: they
# take a vector and a predicate function

# now, use some/every with a predicate (example given below) and the values
# vector to get the same results as using any/all with the x vector
fn <- \(x) x > 5

# some
YOUR_CODE_HERE

# every
YOUR_CODE_HERE

# purrr also has a none function which is the equivalent to !all(), try using
# none instead of every
YOUR_CODE_HERE

# try the examples above with different predicates
# make some return FALSE
fn <- YOUR_CODE_HERE
YOUR_CODE_HERE

# make every return TRUE
fn <- YOUR_CODE_HERE
YOUR_CODE_HERE

# make none return TRUE
fn <- YOUR_CODE_HERE
YOUR_CODE_HERE
