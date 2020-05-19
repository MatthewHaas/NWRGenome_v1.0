# Analysis of the _Zizania palustris_ genome
Annotation of the Zizania palustris genome

9 July 2019: We don't yet have RNA-seq data to do annotation, so the first thing I am trying is using the Oryza sativa genome to find similar genes in the Zizania palustris genome.

30 July 2019: Added starter code for making a dot plot to compare the genomes of _Oryza sativa_ and _Zizania palustris_.

14 January 2020: This past fall, we decided to seek help from the Minnesota Supercomputing Institute Research Informatics Support Specialists (MSI RISS) for the genome annotation since it somewhat beyond my expertise. Today, they gave us an update via a Powerpoint file with some explanations via email.

8 May 2020: Annotation is complete and we have moved into the stage of compiling genome statistics and generating Tables and Figures for the paper so many of the scripts that are currently being added are to advance these goals.

## downsampling (directory)
Contains scripts for downsampling FASTQ files from the pilot GBS project. The aim of this is to test how many SNPs we can get at various depths.

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

## run_R_gene_analog_analysis.sh
Script to conduct Resistance (R) gene analog analysis. Right now the code will not work. I need to make sure all of the software dependencies are downloaded before it will work.

## run_jcvi.sh
Script to execute commands from JCVI software to generate good-looking and informative synteny plot for _Z. palustris_ vs. _O. sativa_. As of 14 May 2020, code is complete enough to the point that I generated the figure that I wanted to create, but in order to make it publication-worthy, there are at least two major changes I want to make: Scaffold numbers should be replaced with our _Z. palustris_-specific chromosome designations and reordered so that the order follows the _Z. palustris_-specific chromosome order.

## snp_density_on_linkage_group.R
This file contains code to create a visual representation of each chromosome/linkage group/scaffold.
At present, it only does this for Scaffold 1. I didn't want to spend time on the other scaffolds unless I thought it would be worth while spending the time to do each scaffold (whether for a presentation or for a paper).
