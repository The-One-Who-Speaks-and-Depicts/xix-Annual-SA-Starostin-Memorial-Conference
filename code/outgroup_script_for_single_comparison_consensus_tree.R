# Reading command line arguments
args = commandArgs(trailingOnly=TRUE)


# importing required packages
library(ape)
library(TreeDist)
library(phytools)
library(TreeTools)

# beforehand, get trees for consensus in a single folder
# importing trees from folder
treeFiles <- list.files(args[1], full.names=TRUE)
# create an array for trees
treesForConsensus <- as.multiPhylo(lapply(treeFiles, ape::read.tree))

at <- averageTree(treesForConsensus)

ape::write.tree(at, "averageTree.newick")


# plot imported tree
png('consensusTree.png')
plot(at)
dev.off()



