# Exercise 9: saving plots using walk

# let's use the previous solution
source("exercises/Solution_08.R")

# create a directory to store plots in, if it doesn't exist
if (!dir.exists("exercises/plots")) dir.create("exercises/plots")

# we now want to save all of the files that were created previously.
# for this, we need a combination of the plots, and filenames.

# we can use the names assigned to the list items of the plots object
names(plots)

# we need to append the names with ".png"
# (hint: use the paste0 function for string concatenation in R)

filenames <- YOUR_CODE_HERE

# now, we can use the walk2 function, along with the filenames and plots objects
# and the ggsave function.

# we don't need to assign the output of walk2 to a variable: walk is for function
# side effects and only returns the first input

# make sure to set the following arguments with ggsave:
#   path = "exercises/plots"
# you could also play about with the height/width by using the following arguments
#   width = 20
#   height = 12
#   units = "cm"

YOUR_CODE_HERE

# you should now see the files in exercises/plots/
