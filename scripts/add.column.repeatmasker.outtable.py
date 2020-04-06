import sys

infile = open("../genome/zizania_palustris_13Nov2018_okGsv.fasta.tab.out","r")
outfile = open("../genome/zizania_palustris_13Nov2018_okGsv.bed","w")

for line in infile:
        f = line.strip().split('\t')
	repf = f[10]
	if '/' in repf:
		repf2 = repf.split('/')
		repf = repf2[0]
	chromf = f[4].split(';')
	chrom = chromf[0]
	outfile.write(chrom+'\t'+f[5]+'\t'+f[6]+'\t'+repf+'\n')




"""
outfile = open("../genome/zizania_palustris_13Nov2018_okGsv.fasta.tab.chromadded.out","w")
for line in infile:
	f = line.strip().split('\t')
	repf = f[10]
	if '/' in repf:
		repf2 = repf.split('/')
		repf = repf2[0]
	chromf = f[4].split(';')
	chrom = chromf[0]
	outfile.write(line.strip()+'\t'+chrom+'\t'+repf+'\n')

"""



