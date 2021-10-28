# safely/possibly

fn <- function(x) {
  if (x > 3) stop("too big!")
  x
}
map_dbl(1:4, fn)

# we can instead wrap our function in possibly if we have a sensible default value for when the function error's
map_dbl(1:4, possibly(fn, NA))

# alternatively, we can use the safely function. Because this returns a list we need to use the map function
map(1:4, safely(fn))

# we can pair this with the keep function to throw away errornous results, then use a map function with the name of the
# item in the list we want to keep (result) to ignore the "error" column
map(1:4, safely(fn)) %>%
  keep(\(x) is.null(x$error)) %>%
  map_dbl("result")
