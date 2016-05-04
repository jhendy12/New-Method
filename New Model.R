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
y1<-tt2$states

single_pagel<-fitPagel(tree,x1,y1)
single_pagel
single_pagel$P
single_pagel$independent.Q
single_pagel$dependent.Q



# Lets try making more simulated data for x and y
# Lets simulate more data to use
# Then put eveything into one matrix for x and one matrix for y

tt3<-sim.history(tree,Q)
x2<-tt3$states
tt4<-sim.history(tree,Q)
y2<-tt4$states
x<-cbind(x1,x2)
trait_num<-(ncol(x))
species_num<-(nrow(x))
y<-cbind(y1,y2)
y_num<-(ncol(y))
trait_names<-colnames (x)
y_names<-colnames (y)




# This code works for multiple x against multiple y (exactly what I want it to do)
# code runs
# ouput works

MultiPagel <- function(tree, trait_num, y_num, x, y) {
multi_pagel<-list() 
d<-data.frame()
for (i in 1:trait_num){
  for (j in 1:y_num){
    multi_pagel[[i]]<-fitPagel(tree,x[,i],y[,j])
    d<-rbind(d, data.frame(x=i, y=j, p=multi_pagel[[i]]$P, bonferroni=p.adjust(multi_pagel[[i]]$P,"bonferroni"),matrix.x=multi_pagel[[i]]$independent.Q, matrix.y=multi_pagel[[i]]$dependent.Q))
    print(d)
      
      }
}
return (d)

}


U1<-MultiPagel(tree, trait_num, y_num, x, y)

