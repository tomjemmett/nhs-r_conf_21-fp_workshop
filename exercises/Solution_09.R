# Solution 9: saving plots using walk

source("exercises/Solution_08.R")
if (!dir.exists("plots")) dir.create("plots")
filenames <- paste0(names(plots), ".png")

walk2(filenames, plots, ggsave, path = "plots")
