import sys

infile = open('/home/jkimball/shared/WR_Annotation/Annotation/wild_rice3/update_misc/pasa/rice.gene_structures_post_PASA_updates.21917.gff3','r')
outfile = open('/home/jkimball/shared/WR_Annotation/Annotation/wild_rice3/update_misc/pasa/augustus.pasa.proteins.longestiso.fa','w')

gdict ={}
for line in infile:
	if line[:5] == '#PROT':
		f = line.strip().split('\t')
		aa = f[1][:-1]
		f2 = f[0].split(' ')
		tid = f2[1]+' '+f2[2]
		gid = f2[2]
		if gid in gdict:
			[otid,oaa,gid] = gdict[gid]
			if len(aa) > len(oaa):
				gdict[gid] = [tid,aa,gid]	
		if gid not in gdict:
			gdict[gid] = []
			gdict[gid] = [tid,aa,gid]
		#outfile.write('>'+tid+'\n')
		#outfile.write(aa+'\n')	

for gid in gdict:
	[tid,aa,gid2] = gdict[gid]
	outfile.write('>'+gid2+'\n')
	outfile.write(aa+'\n') 


