# Pipeline of Data Management for Human Chromosome 16 

The R-script *Vcf2FastaLDJump* contains the pipeline of the data download from the ftp-server for the application on whole chromosome 16. 

* The chromosome was split in 200 parts, converted to fasta files and then LDJump was run on the fasta-file. 
* The constant estimated recombination rates are stored in a vector which is filled up until the whole chromosome is parsed. 
* Hence, smuce was applied to this vector in order to receive the estimated recombination map. 
* These steps are applied for all four populations (IBS, FIN, TSI, GBR). 

# Data Management for Human Chromosome 21 

* We downloaded the *vcf*-File for the populations of TSI, FIN, GBR, and IBS from [here](<http://phase3browser.1000genomes.org/Homo_sapiens/Location/Overview?r=21:41187000-41290679>) by using the "*Get VCF Data*" option. Following to that, we selected the "*By population(s)*" option in order to filter the data. 
* For the later following conversion, we also downloaded the reference of this region by using the "*Export Data*" option ([from here](<http://phase3browser.1000genomes.org/Homo_sapiens/Location/Overview?r=21:41187000-41290679>)) as *fasta*-file and read it with the *read.dna* function from the R-package **ape**. 
* We selected the first 50 individuals based on the individuals names and loaded this file in the workspace. 
* Then, we applied the *vcfR2DNAbin* function from the R-package **vcfR**. 
* Then we created the *fasta*-file with the *write.dna* function from the **ape** R-package. 
* Finally, we applied [**LDJump**](<https://github.com/PhHermann/LDJump>) following the recommendations of 1kb segment lengths and 0.35 quantile for the bias correction. 
* These steps were again applied for the four populations (IBS, FIN, TSI, GBR).

# LDJump Hotspot Positions on Chromosome 16 

We provide the **LDJump** estimated hotspot locations for all four populations (as separate sheets) in the Excel-file *Hotspots_Chr16_LDJump*. This file contains the start and end position of the hotspots as well as the corresponding recombination rate. Notice that we calculated the background recombination rates as mean of all recombination rates smaller than the median of all estimated rates. These estimated background rates are listed in the following table: 


| Population Name  | Background recombination rate |
| :------------- | ------------- |
| TSI  | 0.003984501  |
| FIN  | 0.003169624  |
| GBR  | 0.003527607  |
| IBS  | 0.004126738  |
