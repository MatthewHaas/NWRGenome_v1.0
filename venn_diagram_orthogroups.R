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

# Get the orthogroup IDS for each species.
Osativa_orthogroups <- O_sativa$Orthogroup
Zpalustris_orthogroups <- Z_palustris$Orthogroup
Zmays_orthogroups <- Z_mays$Orthogroup
Lperrieri_orthogroups <- L_perrieri$Orthogroup

# Save data
save(Osativa_orthogroups, Zpalustris_orthogroups, Lperrieri_orthogroups, Zmays_orthogroups, file="orthogroup_names_for_venn_diagram.Rdata")

# In RStudio now... I could not get the venn.diagram function to work. Could not write to PNG for some reason.
setwd("~/Documents/wild_rice")
load("orthogroup_names_for_venn_diagram.Rdata") # File contains sets of Orthogroups to feed into the venn.diagram function.

colors= c("#6b7fff", "#c3db0f", "#ff4059", "#2cff21")

# Make the Venn Diagram
venn.diagram(x=list(Osativa_orthogroups, Zpalustris_orthogroups, Zmays_orthogroups, Lperrieri_orthogroups),
			 category.names = c("O. sativa", "Z. palustris", "Z. mays", "L. perrieri"),
			 filename = "test_venn_diagram.png",
			 output=TRUE,
			 imagetype="png",
			 scaled = FALSE,
			 col = "black",
			 fill = colors,
			 cat.col = colors,
			 cat.cex = 1,
			 margin = 0.15)