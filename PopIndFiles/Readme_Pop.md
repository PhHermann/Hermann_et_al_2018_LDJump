<<<<<<< HEAD
<!--- The files in this folder show the individuals used for the data application on chromosome 16 in Hermann et al. 2018.
* The file *GetPopData.sh* downloads the vcf file for chromosome 16 and then creates vcf-files for every considered European population (IBS, FIN, GBR, TSI). This creation is already performed with the randomly selected individuals. The selection is based on the individuals names by taking the lowest 25 numbers per population. 
* Since **LDJump** requires fasta-files, we transformed the vcf-files to fasta-files with the R-function *vcfR2DNABin* of the R-package **vcfR**. For specific reasons we divided the whole chromosome 16 into 200 parts and applied the conversion for every of these parts. Consequently we applied LDJump on this fasta file and stored the results in a list. After parsing all parts we combined the constant estimates of LDJump and applied smuce on this list to obtain the recombination map on the wholed chromosome 16. Notice that during this step we also used the demography model for the final results. 
=======
<!--- The R-script *Vcf2FastaLDJump* contains the pipeline of the data download from the ftp-server for the application on whole chromosome 16. 

* The chromosome was split in 200 parts, converted to fasta files and then LDJump was run on the fasta-file. 
* The constant estimated recombination rates are stored in a vector which is filled up until the whole chromosome is parsed. 
* Hence, smuce was applied to this vector in order to receive the estimated recombination map. 
* These steps are applied for all four populations. 
>>>>>>> 3e0cc7bdfc546b2d34a54f652901954aed643ccb
--->

.... under construction .....
