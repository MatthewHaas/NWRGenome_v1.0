#!/bin/bash -l
#PBS -l nodes=1:ppn=8,mem=30g,walltime=24:00:00
#PBS -m abe
#PBS -M haasx092@umn.edu
#PBS -e run_jcvi.err
#PBS -o run_jcvi.out
#PBS -N run_jcvi

cd /home/jkimball/haasx092/synteny_figure

export PATH=$PATH:/home/jkimball/haasx092/synteny_figure/last-1060/src

module load python

python -m jcvi.formats.gff bed rice.gene_structures_post_PASA_updates.21917.gff3 -o wild_rice.bed
python -m jcvi.formats.gff bed Osativa_323_v7.0.gene.gff3.gz -o oryza.bed

python -m jcvi.formats.fasta format zizania_palustris_13Nov2018_okGsv.fasta wild_rice.cds
python -m jcvi.formats.fasta format Osativa_323_v7.0.cds.fa.gz oryza.cds

sed -i  's/\./_/g' oryza.bed
sed -i  's/\./_/g' oryza.cds
sed -i 's/;.*$//g' wild_rice.cds

python -m jcvi.compara.catalog ortholog wild_rice oryza --no_strip_names
