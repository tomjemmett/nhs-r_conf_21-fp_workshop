# Solution 14: reduce/accumulate

library(tidyverse)

values <- 1:10

reduce(values, `+`)
accumulate(values, `+`)

reduce(values, `+`, .init = 5)
accumulate(values, `+`, .init = 5)
# note:
  length(accumulate(values, `+`))
# is one less than
  length(accumulate(values, `+`, .init = 5))
