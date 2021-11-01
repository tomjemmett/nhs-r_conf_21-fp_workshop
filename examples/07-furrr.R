# Parallel computation with {furrr}

library(furrr)

# before we can run our code in parallel we need to set up the environment: set workers to how many CPU cores you want
# to run R on
plan(multisession, workers = 2) # multicore on Linux/Mac

# multicore is a much better option, but it does not work on Windows as it relies on process forking which isn't
# supported by Windows. Instead, multisession will start multiple R instances, one per worker. It will have to copy all
# of the memory between all the R processes which can cause issues if you are working with large datasets.

# to show how we can get some speed up, let's create a daft function which sleeps for half a second, then return it's
# input
fn <- function(x) {
  Sys.sleep(0.5)
  x
}

# first, let's use a standard sequential map
tictoc::tic()
x <- map_dbl(1:10, fn)
tictoc::toc()

# now we can test out with a parallel map
tictoc::tic()
y <- future_map_dbl(1:10, fn)
tictoc::toc()

# we can stop our parallel workers when we are done
plan(sequential)
# now future map will work just like a standard map
tictoc::tic()
z <- future_map_dbl(1:10, fn)
tictoc::toc()
