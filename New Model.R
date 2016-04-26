#Load appropriate libraries
library(ape)
library(geiger)
library(phytools)

#Input data
# a "phylo" tree
# a vector of phenotypic values for multiple binary traits for the species in tree (x)
# each different trait needs to go into a different column
# a binary character for the species in the tree that all other traits will be tested against (y)
# for this example that would be wild v. domesticated

setwd("~/GitHub/New-Method")
Trial.data<-read.csv("Trial_data.csv")

# Build a tree first then output tree file with other results
# Give option to have function build a tree or use a given tree

# have a check function to check and make sure function has everything it needs to run

# make a loop function that runs Pagel for each of the traits (x) given against a single trait (y)
#   if you have six traits it should run once for each trait
# Setup a way to constrain the root of the tree to match a particular trait (y)
#   in this case it would be to constrain tree root to match wild type

# loop fitPagel(tree, x<-1, y)
# fitPagel (tree, [x<-1+previous line, up to total number of traits, then stop], y)

# Output


#End goal of function
#Tell which traits are correlated with which the determinant trait

#fitPagel(tree, x, y, ...)
# tree - an object of class "phylo"
# x - a vector of phenotypic values for a binary trait for the species in tree
# y - a second binary character for the species in tree
# ... - optional argumett. Currently includes method, which can be set to "ace" to use the ace function in ape for optimization.
# Or to "fitDiscrete" (if geiger package is installed) to use geiger's firDiscrete for optimization