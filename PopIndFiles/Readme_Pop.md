<!--- The files in this folder show the individuals used for the data application on chromosome 16 in Hermann et al. 2018.
* The file *GetPopData.sh* downloads the vcf file for chromosome 16 and then creates vcf-files for every considered European population (IBS, FIN, GBR, TSI). This creation is already performed with the randomly selected individuals. The selection is based on the individuals names by taking the lowest 25 numbers per population. 
* Since **LDJump** requires fasta-files, we transformed the vcf-files to fasta-files with the R-function *vcfR2DNABin* of the R-package **vcfR**. For specific reasons we divided the whole chromosome 16 into 200 parts and applied the conversion for every of these parts. Consequently we applied LDJump on this fasta file and stored the results in a list. After parsing all parts we combined the constant estimates of LDJump and applied smuce on this list to obtain the recombination map on the wholed chromosome 16. Notice that during this step we also used the demography model for the final results. 
--->

.... under construction .....
