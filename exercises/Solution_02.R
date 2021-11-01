# Solution 2: rescale_01 function

set.seed(20191105)

df <- tibble::tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

rescale_01 <- function(x) {
  (x - min(x, na.rm = TRUE)) / (max(x, na.rm = TRUE) - min(x, na.rm = TRUE))
}

# alternatively:

rescale_01 <- function(x) {
  x_min <- min(x, na.rm = TRUE)
  x_max <- max(x, na.rm = TRUE)
  x_range <- x_max - x_min

  (x - x_min) / x_range
}

# or:

rescale_01 <- function(x) {
  x_range <- range(x, na.rm = TRUE)

  # you could write it like this
  # (x - x_range[[1]]) / (x_range[[2]] - x_range[[1]])

  # but I prefer the following
  (x - x_range[[1]]) / diff(x_range)
}

df$a <- rescale_01(df$a)
df$b <- rescale_01(df$b)
df$c <- rescale_01(df$c)
df$d <- rescale_01(df$d)

# or
library(tidyverse) # make sure tidyverse is loaded

df <- df %>%
  mutate(a = rescale_01(a),
         b = rescale_01(b),
         c = rescale_01(c),
         d = rescale_01(d))

# you could also be clever and use

df <- df %>%
  mutate(across(a:d, rescale_01))
