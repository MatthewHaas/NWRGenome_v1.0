# 26 May 2020
# Purpose of this code is to make a venn diagram for overlapping Orthogroups for the NWR genome paper
# WD: /home/jkimball/haasx092

# Load required packages
library(data.table)
library(VennDiagram)

# Read in data
x <- fread("/home/jkimball/shared/WR_Annotation/Orthofinder/Orthogroups/Results_Mar04/WorkingDirectory/OrthoFinder/Results_Mar30/Orthogroups/Orthogroups.GeneCount.tsv")

# Find all rows for which each species has at least one gene present in the orthogroup
O_sativa <- x[Oryza_sativa > 0]
Z_palustris <- x[Zizania_palustris > 0]
Z_mays <- x[Zea_mays > 0]
L_perrieri <- x[Leersia_perrieri > 0]
B_distachyon <- x[Brachypodium_distachyon > 0]
S_bicolor <- x[Sorghum_bicolor > 0]

# Get the orthogroup IDS for each species.
Osativa_orthogroups <- O_sativa$Orthogroup
Zpalustris_orthogroups <- Z_palustris$Orthogroup
Zmays_orthogroups <- Z_mays$Orthogroup
Lperrieri_orthogroups <- L_perrieri$Orthogroup
Bdistachyon_orthogroups <- B_distachyon$Orthogroup
Sbicolor_orthogroups <- S_bicolor$Orthogroup

# Save data
save(Osativa_orthogroups, Zpalustris_orthogroups, Lperrieri_orthogroups, Zmays_orthogroups, Bdistachyon_orthogroups, Sbicolor_orthogroups, file="orthogroup_names_for_venn_diagram.Rdata")

# In RStudio now... I could not get the venn.diagram function to work. Could not write to PNG for some reason.
setwd("~/Documents/wild_rice")
load("orthogroup_names_for_venn_diagram.Rdata") # File contains sets of Orthogroups to feed into the venn.diagram function.

colors= c("#6b7fff", "#c3db0f", "#ff4059", "#2cff21", "#de4dff")

# Make the Venn Diagram
venn.diagram(x=list(Osativa_orthogroups, Zpalustris_orthogroups, Zmays_orthogroups, Bdistachyon_orthogroups, Sbicolor_orthogroups),
			 category.names = c(expression(italic("O. sativa")), expression(italic("Z. palustris")), expression(italic("Z. mays")), expression(italic("B. distachyon")),
			 expression(italic("S. bicolor"))),
			 filename = "test_venn_diagram.png",
			 output=TRUE,
			 imagetype="png",
			 scaled = FALSE,
			 col = "black",
			 fill = colors,
			 cat.col = colors,
			 cat.cex = 1,
			 cat.dist = 0.26,
			 margin = 0.15)