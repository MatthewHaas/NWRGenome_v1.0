import sys,string

infile = open(sys.argv[1],'r')
outfile = open(sys.argv[2],'w')

for line in infile:
	f = line.strip().split('\t')
	chromf = f[2].split(';')
	chrom = chromf[0]
	f[2] = chrom
	outfile.write('\t'.join(f)+'\n')

