#!/bin/bash -l
#PBS -l nodes=1:ppn=8,mem=30g,walltime=6:00:00
#PBS -m abe
#PBS -M haasx092@umn.edu
#PBS -e run_jcvi.err
#PBS -o run_jcvi.out
#PBS -N run_jcvi

cd /home/jkimball/haasx092/synteny_figure

export PATH=$PATH:/home/jkimball/haasx092/synteny_figure/last-1060/src
export PATH=$PATH:/home/jkimball/haasx092/synteny_figure/install-tl-20200505/1/bin/x86_64-linux

module load python

python -m jcvi.formats.gff bed rice.gene_structures_post_PASA_updates.21917.gff3 -o wild_rice.bed
python -m jcvi.formats.gff bed Osativa_323_v7.0.gene.gff3.gz -o oryza.bed

python -m jcvi.formats.fasta format rice.gene_structures_post_PASA_updates.nucleotides.fsa wild_rice.cds
python -m jcvi.formats.fasta format Osativa_323_v7.0.cds.fa.gz oryza.cds

sed -i  's/\.MSUv7.0//g' oryza.bed
sed -i  's/\..*$//g' oryza.cds
sed -i 's/\-.*$//g' wild_rice.cds

# Do a literal search and replace to switch out Dovetail scaffold IDs with our Zizania palustris chromosome numbers
# This should prevent close matches from being treated the same (e.g., Scaffold_1, Scaffold_13, Scaffold_18, etc)
sed -i 's/\<Scaffold_1\>/Chr9/g' wild_rice.bed
sed -i 's/\<Scaffold_3\>/Chr3/g' wild_rice.bed
sed -i 's/\<Scaffold_7\>/Chr15/g' wild_rice.bed
sed -i 's/\<Scaffold_9\>/Chr11/g' wild_rice.bed
sed -i 's/\<Scaffold_13\>/Chr1/g' wild_rice.bed
sed -i 's/\<Scaffold_18\>/Chr4/g' wild_rice.bed
sed -i 's/\<Scaffold_48\>/Chr6/g' wild_rice.bed
sed -i 's/\<Scaffold_51\>/Chr16/g' wild_rice.bed
sed -i 's/\<Scaffold_70\>/Chr10/g' wild_rice.bed
sed -i 's/\<Scaffold_93\>/Chr2/g' wild_rice.bed
sed -i 's/\<Scaffold_415\>/Chr12/g' wild_rice.bed
sed -i 's/\<Scaffold_693\>/Chr14/g' wild_rice.bed
sed -i 's/\<Scaffold_1062\>/Chr8/g' wild_rice.bed
sed -i 's/\<Scaffold_1063\>/Chr7/g' wild_rice.bed
sed -i 's/\<Scaffold_1064\>/Chr13/g' wild_rice.bed
sed -i 's/\<Scaffold_1065\>/Chr5/g' wild_rice.bed

python -m jcvi.compara.catalog ortholog wild_rice oryza --cscore=1.0 --no_strip_names

python -m jcvi.graphics.dotplot wild_rice.oryza.anchors

python -m jcvi.compara.synteny screen --minspan=30 --simple wild_rice.oryza.anchors wild_rice.oryza.anchors.new

python -m jcvi.graphics.karyotype seqids layout
