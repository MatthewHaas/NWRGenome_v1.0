#!/bin/bash
#PBS -l mem=16GB,nodes=1:ppn=12,walltime=12:00:00
#PBS -A msistaff
#PBS -m abe
#PBS -j oe
#PBS -M mmacchie@umn.edu
#PBS -q amdsmall
#PBS -W group_list=msistaff
#PBS -N samtools

module load samtools

cd /home/jkimball/shared/WR_Annotation/Aligned_reads/ 
echo -n "Ran: "
date

#samtools view rice_rnas2Aligned.sortedByCoord.out.bam > rice_rnas2Aligned.sortedByCoord.out.sam
#echo -n "Finished bam-to-sam conversion: "
#date


# change scaffold IDs in sam file
python /home/jkimball/shared/WR_Annotation/scripts/reformatted.sam.py rice_rnas2Aligned.sortedByCoord.out.sam rice_rnas2Aligned.sortedByCoord.out.chromreformatted.sam
echo -n "Finished sam chromosome reformatting conversion: "

# convert sam file back into bam file
samtools view -S -b rice_rnas2Aligned.sortedByCoord.out.chromreformatted.sam > rice_rnas2Aligned.sortedByCoord.out.chromreformatted.bam

echo -n "Finished sam-to-bam conversion: "
date




