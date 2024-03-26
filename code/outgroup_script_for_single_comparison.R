# Reading command line arguments
args = commandArgs(trailingOnly=TRUE)


# importing required packages
library(ape)
library(TreeDist)


# for the purposes of this research, I insert human-hypothesised tree manually
prototypeTree <- ape::read.tree(text="('Govor Hvara', ('Govor severne Metohije', 'Govor Kuča'), 'Govor Lužnice');")

# display short summary (Paradis and Schliep, 2019)
summary(prototypeTree)

# importing results of automatic classification
treeUnderConsideration <- ape::read.tree(args[1])

# get info about imported tree
summary(treeUnderConsideration)

# plot imported tree
png('treeUnderConsideration.png')
plot(treeUnderConsideration)
dev.off()

# show MCI (Smith, 2020)
sprintf("MutualClusteringInfo is %f", MutualClusteringInfo(prototypeTree, treeUnderConsideration))








