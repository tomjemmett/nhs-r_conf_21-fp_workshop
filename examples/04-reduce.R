# Reduce

# the reduce function takes a vector and a binary function and calls the function on successive pairs until we are left
# with just a single value.

# for instance, we can get a list of the unique numbers that appear in a list of numeric vectors

# first, let's create a list of numeric vectors
set.seed(123)
numbers <- map(rep(15, 4), compose(sort, sample), x = 1:10, replace = TRUE)
str(numbers)

# we can then simply use the "intersect" function from base R.
reduce(numbers, intersect)

# in this case, our function intersect takes two arguments of one type (numeric) and returns the same type.

# reduce can work with a binary function that takes a value of type A and a value of type B and returns a value of type
# A. For instance, we could create a function that combines the sum each numeric vector in our list, concatenating the
# result into a single string. For this to work we need to provide an initial value.

reduce(numbers, \(x, y) paste(x, sum(y)), .init = "")

# we can also change the direction that the reduction happens in by changing the .dir argument

reduce(numbers, \(x, y) paste(y, sum(x)), .init = "", .dir = "backward")

