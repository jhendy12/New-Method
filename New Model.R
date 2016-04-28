# Load appropriate libraries
library(ape)
library(geiger)
library(phytools)

# Dummy data taken from Liam Revell
tree<-pbtree(n=300,scale=1)
Q<-matrix(c(-1,1,1,-1),2,2)
rownames(Q)<-colnames(Q)<-letters[1:2]
tt1<-sim.history(tree,Q)
tt2<-sim.history(tree,Q)

x1<-tt1$states
y<-tt2$states

single_pagel<-fitPagel(tree,x1,y)
single_pagel
single_pagel$P



tt3<-sim.history(tree,Q)
x2<-tt3$states


Pagel1<-fitPagel(tree,x1,y)
Pagel2<-fitPagel(tree,x2,y)

# This part works
# not a loop though and only works for 3 traits as individual vectors
multi_pagel<-
  {
  Pagel1<-fitPagel(tree,x1,y)
  print(paste("Trait 1 P-Value:", Pagel1$P))
  Pagel2<-fitPagel(tree,x2,y)
  print(paste("Trait 2 P-Value:", Pagel2$P))
  Pagel3<-fitPagel(tree,x3,y)
  print(paste("Trait 3 P-value:", Pagel3$P))
}


# Lets try to make a loop for having all of the traits (x) in one matrix

x<-cbind(x1,x2)
trait_num<-(ncol(x))
species_num<-(nrow(x))

multi_pagel<-0
results<-list()
for (i in 1:trait_num)
{
  multi_pagel[i]<-fitPagel(tree,x[,i],y)
  results[[i]]<-matrix(multi_pagel[i],species_num,trait_num)
}
results2<-do.call(rbind,results)

#result_list <- list()
#for(i in 1:5){
#  n <- sample(1:5, 1)
#  result_list[[i]] <- matrix(0, n, 3)
#}
#result_final <- do.call(rbind, result_list)




# Failed script and helpful stuff below
# some script has been deleted

# Old not working dummy data
#setwd("~/GitHub/New-Method")
#Trial.data<-read.csv("Trial_data.csv")
#Trial.data.x<-read.csv("Trial_data_x.csv")
#Trial.data.y<-read.csv("Trial_data_y.csv")
#tree<-"need a tree"
#x<-Trial.data.x
#y<-Trial.data.y

# Plot single_pagel
#par(mfrow=c(1,2))
#plotSimmap(tt1,setNames(c("blue","red"),letters[1:2]),ftype="off",lwd=1)
#plotSimmap(tt2,setNames(c("blue","red"),letters[1:2]),ftype="off",lwd=1,direction="leftwards")

# str(single_pagel) This lets you see what is in a function.  Then use the $ to pull out the item needed.

#End goal of function
# Tell which traits are correlated with which the determinant trait
# List the p-values for each trait?

# Tried to write a loop that would take one matrix with all of the x values
# loop fitPagel(tree, x<-1, y)
# fitPagel (tree, [x<-1+previous line, up to total number of traits, then stop], y)

#c<-ncol(x)
#multi_pagel<-0
#for(i in 2:c)
#{
#  multi_pagel[i]<-fitPagel(tree, x[i], y) 
#  print(multi_pagel[i])
#}
#print(i)

#fitPagel(tree, x, y, ...)
# tree - an object of class "phylo"
# x - a vector of phenotypic values for a binary trait for the species in tree
# y - a second binary character for the species in tree
# ... - optional argumett. Currently includes method, which can be set to "ace" to use the ace function in ape for optimization.
# Or to "fitDiscrete" (if geiger package is installed) to use geiger's firDiscrete for optimization

#Input data
# a "phylo" tree
# a vector of phenotypic values for multiple binary traits for the species in tree (x)
# each different trait needs to go into a different column
# a binary character for the species in the tree that all other traits will be tested against (y)
# for this example that would be wild v. domesticated