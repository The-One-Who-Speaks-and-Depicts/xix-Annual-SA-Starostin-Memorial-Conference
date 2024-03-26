# Reading command line arguments
args = commandArgs(trailingOnly=TRUE)


# importing required packages
library(ape)
library(TreeDist)


# for the purposes of this research, I insert human-hypothesised tree manually
prototypeTree <- ape::read.tree(text="('Govor Hvara', ('Govor severne Metohije', 'Govor Kuča'), 'Govor Lužnice');")
# display short summary (Paradis and Schliep, 2019)
summary(prototypeTree)

# plot the ideal tree
png('gilded.png')
plot(prototypeTree)
dev.off()

# importing results of automatic classification
trees <- list.files(args[1], full.names=TRUE)

# score MCI for each of the imported trees
mutualClusteringInfos <- c()

for (x in trees) {
	# Smith (2020)
	mutualClusteringInfos <- c(mutualClusteringInfos, MutualClusteringInfo(prototypeTree, ape::read.tree(x), normalize = TRUE))
}

sprintf("Mean MutualClusteringInfo is %f", mean(mutualClusteringInfos))



