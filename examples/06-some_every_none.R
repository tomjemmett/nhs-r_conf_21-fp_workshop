# some/every/none

# these functions are similar to the base functions all/any, except instead of taking a logical vector they accept any
# kind of vector, and a predicate function that takes

values <- list(1:3, 4:6, 7:9)

# Here we will get TRUE, TRUE, FALSE
sum_gt_5 <- \(x) sum(x) > 5
map_lgl(values, sum_gt_5)

  some(values, sum_gt_5)
  every(values, sum_gt_5)
  none(values, sum_gt_5)

# This time only some will return TRUE
sum_gt_7 <- \(x) sum(x) > 7
map_lgl(values, sum_gt_7)

  some(values, sum_gt_7)
  every(values, sum_gt_7)
  none(values, sum_gt_7)

# Finally, only none will return TRUE
sum_gt_25 <- \(x) sum(x) > 25
map_lgl(values, sum_gt_25)

  some(values, sum_gt_25)
  every(values, sum_gt_25)
  none(values, sum_gt_25)
