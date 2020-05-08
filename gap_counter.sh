#!/bin/bash
#PBS -l nodes=1:ppn=8,mem=15g,walltime=1:00:00
#PBS -m abe
#PBS -M haasx092@umn.edu
#PBS -e gap_counter.err
#PBS -o gap_counter.out
#PBS -N gap_counter

cd /home/jkimball/haasx092/genome_seq

module load python3

for fasta_file in $(cat major_scaffolds.txt);
do
STEM=$(echo ${fasta_file} | cut -f 1 -d ".")
python gap_counter.py $fasta_file 1> ${STEM}_gaps.out
done
