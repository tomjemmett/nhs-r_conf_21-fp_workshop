# Solution 9: saving plots using walk

source("exercises/Solution_08.R")
if (!dir.exists("exercises/plots")) dir.create("exercises/plots")
filenames <- paste0(names(plots), ".png")

walk2(filenames, plots, ggsave, path = "exercises/plots")

# you should now see the files in exercises/plots/
