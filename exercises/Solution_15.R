# Solution 15: some/every/none

library(tidyverse)

values <- 1:9

fn <- \(x) x > 5

some(values, fn)
every(values, fn)
none(values, fn)

fn <- \(x) x > 9
some(values, fn)

fn <- \(x) x < 10
every(values, fn)

fn <- \(x) x > 9
none(values, fn)
