# 14 January 2020
# This code is for making figures representing distribution of SNPs along each scaffold in our assembly
# Only doing Scaffold_1 for now (as a test). Data came from the file 191126_full_set_main_gbs_snps_filtered_q50_dp6.csv
# Code was run on desktop with Rstudio version 1.1.456 (R version 3.6.2)
# WD: C:/Users/haasx092/Documents/wild_rice

# Load required packages
library(plotrix) # required for draw.circle

# Set boundaries for rectangle
xleft <- 0
xright <- 0.25
ybottom <- 0
ytop <- 95.6

# Create the plot
pdf("200114_sample_snp_density_on_scaffolds.pdf")
plot(1, type='n', xlim=c(0,5), ylim=c(0,96), xaxt='n', 
     yaxt='n', xlab='', ylab='', frame.plot=FALSE)
# Make ends of the chromosome round using circles
# Circles come before the actual chromosome to improve visual aesthetic
draw.circle(0.125, 95.6, radius=0.125, col="white")
draw.circle(0.125, 0, radius=0.125, col="white")
# Draw a simple representation of a chromosome using a rectangle
rect(xleft=xleft, ybottom=ybottom, xright=xright, ytop=ytop, 
     col="white", border="black", xpd="TRUE")
# Draw segments on chromosome that correspnd to the physical distance (in megabase pairs, Mbp)
segments(x0=0, x1=0.25, y0=92.6, y1=92.6)
segments(x0=0, x1=0.25, y0=90.8, y1=90.8)
segments(x0=0, x1=0.25, y0=88.8, y1=88.8)
segments(x0=0, x1=0.25, y0=85.3, y1=85.3)
segments(x0=0, x1=0.25, y0=82.6, y1=82.6)
segments(x0=0, x1=0.25, y0=79.8, y1=79.8)
segments(x0=0, x1=0.25, y0=76.6, y1=76.6)
segments(x0=0, x1=0.25, y0=74.5, y1=74.5)
segments(x0=0, x1=0.25, y0=72.5, y1=72.5)
segments(x0=0, x1=0.25, y0=61.1, y1=61.1)
segments(x0=0, x1=0.25, y0=57.6, y1=57.6)
segments(x0=0, x1=0.25, y0=43.3, y1=43.3)
segments(x0=0, x1=0.25, y0=39.3, y1=39.3)
segments(x0=0, x1=0.25, y0=36.8, y1=36.8)
segments(x0=0, x1=0.25, y0=34.8, y1=34.8)
segments(x0=0, x1=0.25, y0=30.7, y1=30.7)
segments(x0=0, x1=0.25, y0=28.5, y1=28.5)
segments(x0=0, x1=0.25, y0=26.5, y1=26.5)
segments(x0=0, x1=0.25, y0=21.2, y1=21.2)
segments(x0=0, x1=0.25, y0=19.4, y1=19.4)
segments(x0=0, x1=0.25, y0=17.5, y1=17.5)
segments(x0=0, x1=0.25, y0=15.5, y1=15.5)
segments(x0=0, x1=0.25, y0=12.4, y1=12.4)
segments(x0=0, x1=0.25, y0=8.6, y1=8.6)
# Add text on the right side of plot indicating position and # of SNPs
text(x=0.5, y=95.6, labels="0 Mbp", adj=0, cex=0.6) # Top/beginning
text(x=0.5, y=0, labels="95.6 Mbp", adj=0, cex=0.6) # Bottom/end
text(x=0.5, y=93.2, labels="3.0 Mbp (108 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=90.8, labels="4.8 Mbp (12 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=88.4, labels="5.8 Mbp (32 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=85.3, labels="10.3 Mbp (24 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=82.6, labels="11.0, 13.0, and 14.0 Mbp (1 SNP each)", adj=0, cex=0.6)
text(x=0.5, y=79.8, labels="15.8 Mbp (15 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=76.6, labels="19.0 Mbp (6 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=74.5, labels="20.1 Mbp (20 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=72.2, labels="21.0 Mbp (22 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=61.1, labels="34.0 Mbp (22 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=57.6, labels="38.0 Mbp (5 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=43.3, labels="52.3 Mbp (11 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=39.3, labels="56.8 Mbp (1 SNP)", adj=0, cex=0.6)
text(x=0.5, y=36.8, labels="57.8 Mbp (55 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=34.4, labels="60.6 Mbp (1 SNP)", adj=0, cex=0.6)
text(x=0.5, y=30.7, labels="65.5 Mbp (15 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=28.5, labels="66.4 Mbp (11 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=26.2, labels="67.8 Mbp (16 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=22.4, labels="75.0 Mbp (17 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=20.2, labels="76.5 Mbp (1 SNP)", adj=0, cex=0.6)
text(x=0.5, y=17.5, labels="77.8 Mbp (1 SNP)", adj=0, cex=0.6)
text(x=0.5, y=15.2, labels="79.8 Mbp (31 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=12.4, labels="83.2 Mbp (2 SNPs)", adj=0, cex=0.6)
text(x=0.5, y=8.6, labels="87.0 Mbp (15 SNPs)", adj=0, cex=0.6)
# Add a title to the figure (scaffold name is probably best)
title("Scaffold 1")
dev.off()
