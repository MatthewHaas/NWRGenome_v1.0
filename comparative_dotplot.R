# 30 July 2019
# WD: /home/jkimball/haasx092/genome_seq

# Purpose of this code is to make a dot plot comparing Zizania palustris scaffolds to chromosomes of Oryza sativa
# Scale: Chromsomes/scaffolds distances are in megabase pairs, although no numbers are printed on the plot

# module load R/3.6.0

library(data.table)

# Read in data
fread("alignment_data_dot_plot.csv") -> x # currently, this file only contains data for 1 comparison

# main problem with this approach: data for each chrom/scaffold starts from zero, but numbers here are continuous. 
# maybe a good approach is to use the endpoint of the previous chromosome as "zero" for the following chromosome.

# Define names for title and x and y labels (done this way to make it easier to read
main="Collinearity between Asian rice and Northern wild rice"
xlab=expression(paste(italic("Oryza sativa")))
ylab=expression(paste(italic("Zizania palustris")))

# Define chromosome boundaries (where to draw blue lines) 
# These can be used for converting positions of collinear sequences
vertical = c(0,43.7,79.2,115.6,151.1,181.1,212.3,242.0,270.5,293.5,316.7,345.7,373.2)
horizontal = c(0,95.2,154.1,193.2,256.4,351.9,450.6,568.6,582.5,693.9,797.3,903.1,927.2,1002.9,1045.5,1156.8,1223.4)

# Define midpoints (for labels)
oryza_mids = c(21.6, 61.2,97.4,133.4,166.1, 196.7,227.2,256.3,282.0,305.1,331.2,359.5)
zizania_mids = c(47.6,124.6,173.6,224.8,304.1,401.3,509.6,575.6,638.2,745.6,850.2,915.2,965.1,1024.2,1101.1,1190.1)

# red = alignment
# blue = reverse alignment

# Make plot
pdf("out.pdf")
x[, plot(1, type='n', xlab=xlab, ylab=ylab, main=main, xlim=c(0,380), ylim=c(0,1230), xaxt='n', yaxt='n')]
x[, points(x, y, col="red", pch=16, cex=0.5)]
axis(1, labels=c(1,2,3,4,5,6,7,8,9,10,11,12), at=oryza_mids)
axis(2, labels=c(1,3,7,9,13,18,48,51,70,93,415,693,1062,1063,1064,1065), at=zizania_mids, las=2)
abline(v=vertical, h=horizontal, col="blue")
dev.off()