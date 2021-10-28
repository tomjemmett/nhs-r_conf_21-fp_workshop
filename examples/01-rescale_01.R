# Rescale
# this has been borrowed from Chapter 19 of R4DS

# first, let's create a dataframe
set.seed(123)
df <- tibble(a = rnorm(10), b = rnorm(10), c = rnorm(10), d = rnorm(10))
df

# we can build a function to rescale the columns in this dataframe to have values between 0 and 1
rescale_01 <- function(x) {
  min_x <- min(x, na.rm = TRUE)
  max_x <- max(x, na.rm = TRUE)

  (x - min_x) / (max_x - min_x)
}

# let's copy the dataframe to show how we can use a for loop
df_copy <- df

# we can use a couple of approaches, seq_along(df_copy) will give us the numbers 1:4 for the 4 columns
# we could also use colnames(df_copy) to give us a, b, c, d
for (i in seq_along(df_copy)) {
  df_copy[[i]] <- rescale_01(df_copy[[i]])
}

df_copy

# we can use map to solve this instead,
map(df, rescale_01)

# but, map gives us a list, we want a dataframe. We can use map_dfc as we are binding by columns
df <- map_dfc(df, rescale_01)
df
