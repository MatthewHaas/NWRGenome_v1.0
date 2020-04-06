#!/bin/bash
#PBS -l mem=250GB,nodes=1:ppn=24,walltime=96:00:00
#PBS -A jkimball 
#PBS -m abe
#PBS -j oe
#PBS -M mmacchie@umn.edu
#PBS -q ram256g
#PBS -W group_list=jkimball
#PBS -N oases

module load oases/0.2.08
module load velvet/1.2.10


echo -n "Ran: "
date


OUT='/panfs/roc/scratch/konox006/JKimball/RNASeq/oases_assembly/'
/soft/oases/0.2.08/scripts/oases_pipeline.py -m 35 -M 59 -s 6 -o ${OUT}/oases -d ' -shortPaired -separate -fastq.gz /panfs/roc/scratch/konox006/JKimball/RNASeq/Trimmed_reads/WR_8Tissues.R1.trimmed.fastq.gz /panfs/roc/scratch/konox006/JKimball/RNASeq/Trimmed_reads/WR_8Tissues.R2.trimmed.fastq.gz' -p '-min_trans_lgth 200'

echo -n "Done: "
date




