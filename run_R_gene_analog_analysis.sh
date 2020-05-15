#!/bin/bash -l
#PBS -l nodes=1:ppn=8,mem=15g,walltime=4:00:00
#PBS -m abe
#PBS -M haasx092@umn.edu
#PBS -e RGA_analysis.err
#PBS -o RGA_analysis.out
#PBS -N RGA_analysis

# This script is for conducting Resistance Gene Analog (RGA) analysis for Northern Wild Rice
# Uses the RGAugury pipeline (Li, P., Quan, X., Jia, G., Xiao, J., Cloutier, S. and You, F.M. (2016) RGAugury: a pipeline for genome-wide prediction of resistance gene analogs (RGAs) in plants. BMC genomics, 17, 852.)

# Change into proper directory
cd /home/jkimball/haasx092/R_gene_analogs

# Load required software
module load ncbi_blast+
module load perl
module load bioperl
module load zlib
module load freetype
module load libgd

# Set up environment
export PATH=$PATH:/home/jkimball/haasx092/bin/phobius1.01 # to specify the path of phobius.pl script and binary.
export PATH=$PATH:/home/jkimball/haasx092/R_gene_analogs/hmmer-3.3/bin # binary path
#export PATH=$PATH:/home/jkimball/haasx092/bin/blast/bin # binary path of blast+ package
export PATH=$PATH:/home/jkimball/haasx092/R_gene_analogs/rgaugury # this package scripts path
export PATH=$PATH:/home/jkimball/haasx092/R_gene_analogs/rgaugury/coils #the path to scoils-ht, which is a modified version of coils to adapt to RGAugury pipeline.
export PATH=$PATH:/home/jkimball/haasx092/R_gene_analogs/interproscan-5.44-79.0 #download latest one as your wish. Do not add the path of "bin" under interproscan directory.
export PATH=$PATH:/home/jkimball/haasx092/Downloads/PfamScan #to specify the path for script of pfam_scan.pl
export PATH=$PATH:/home/jkimball/haasx092/R_gene_analogs/cvit.1.2.1 #to specify the path of cvit.pl in CViT package, make sure cvit.pl can be found by 'which' command.
export COILSDIR=/home/jkimball/haasx092/R_gene_analogs/rgaugury/coils
#export PERL5LIB=/home/lipch/Downloads/PfamScan:$PERL5LIB #perl module for pfam_scan.pl
export PFAMDB=/home/jkimball/haasx092/database/pfamdb #to specifiy the hmm pfam-A/B DB path

# Define filenames
PROTEIN_FASTA=/home/jkimball/shared/WR_Annotation/Annotation/wild_rice3/update_misc/pasa/augustus.pasa.proteins.fa
GENOME_FASTA=/home/jkimball/shared/WR_Annotation/Annotation/wild_rice3/Zizania_palustris_0.1_CDS.fasta.gz
GFF_FILE=/home/jkimball/shared/WR_Annotation/Annotation/wild_rice3/update_misc/pasa/rice.gene_structures_post_PASA_updates.21917.gff3 

# Other
PREFIX=ZizaniaPalustris
# It is also possible to specify the cpu or threads number. For now, will leave as default (default=2).

# Run pipeline
perl RGAugury.pl -p $PROTEIN_FASTA -g $GENOME_FASTA -gff $GFF_FILE -pfx $PREFIX


# Notes about dependencies (can be deleted later...)
# RGAugury dependencies:
# Log::Log4perl installed here using "cpan install Log::Log4perl"
#/home/jkimball/haasx092/perl5/lib/perl5/x86_64-linux-thread-multi/perllocal.pod
#MSCHILLI/Log-Log4perl-1.49.tar.gz

# GD graphic library:
# ?

# Moose
#/home/jkimball/haasx092/perl5/lib/perl5/x86_64-linux-thread-multi/perllocal.pod
#ETHER/Moose-2.2012.tar.gz
