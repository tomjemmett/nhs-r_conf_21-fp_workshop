# Solution 1: creating a function

# Solution:
my_function <- function(x) {
  3 * x + 1
}

# note: if your function is only a single line of code, like above, you don't
# have to include the brackets ({ and }).
# my_function <- function(x) 3 * x + 1

my_function(1)
my_function(2)
my_function(3)

# This isn't always a great idea - it can introduce bugs.
# One of the most famous examples of this was the Apple "goto fail" bug. They
# accidently duplicated a line of code, but because the statements weren't
# inside of brackets the 2nd goto fail line was always executed, which in that
# case caused any security certificate to be accepted even if it wasn't valid
# https://nakedsecurity.sophos.com/2014/02/24/anatomy-of-a-goto-fail-apples-ssl-bug-explained-plus-an-unofficial-patch/
