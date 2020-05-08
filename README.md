# Analysis of the _Zizania palustris_ genome
Annotation of the Zizania palustris genome

9 July 2019: We don't yet have RNA-seq data to do annotation, so the first thing I am trying is using the Oryza sativa genome to find similar genes in the Zizania palustris genome.

30 July 2019: Added starter code for making a dot plot to compare the genomes of _Oryza sativa_ and _Zizania palustris_.

14 January 2020: This past fall, we decided to seek help from the Minnesota Supercomputing Institute Research Informatics Support Specialists (MSI RISS) for the genome annotation since it somewhat beyond my expertise. Today, they gave us an update via a Powerpoint file with some explanations via email.

## scripts (directory)
Contains annotation scripts created by Tom and Marissa from RISS

## add_scalebar_to_annotation_photo.html
HTML version of Jupyter Notebook file below.

## add_scalebar_to_annotation_photo.ipynb
Jupyter Notebook file containing Python code for adding a scale bar to image of tissues collected for wild rice genome annotation.

## blast_RM106

## blast_for_annotation

## blast_for_shattering_genes.txt

## gap_counter.py
Python script to count gaps (strings of Ns) in a given FASTA sequence file.

## gap_counter.sh
Shell script to launch the Python script _gap_counter.py_.

## make_gap_count_table.sh
Script makes a tab-separated table containing the number of gaps in each scaffold/pseudochromosome using the output of the gap_counter.sh/gap_counter.py scripts.

## run_jcvi.sh
Script to execute commands from JCVI software to generate good-looking and informative synteny plot for _Z. palustris_ vs. _O. sativa_. The code appears to still have some issues and I'm not sure why it isn't finding the anchors that are necessary to move on to the next step.

## snp_density_on_linkage_group.R
This file contains code to create a visual representation of each chromosome/linkage group/scaffold.
At present, it only does this for Scaffold 1. I didn't want to spend time on the other scaffolds unless I thought it would be worth while spending the time to do each scaffold (whether for a presentation or for a paper).

## zp_os_synteny.txt
General text file containing code that I ran on the command line to figure out how to make a good-looking and informative synteny plot using python-language programs from JCVI. Also contains comments about some of the problems I encountered and how to solve them. A precursor to the script _run_jcvi.sh_.
