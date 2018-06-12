# Pipeline of Data Management for Human Chromosome 16 

The R-script *Vcf2FastaLDJump* contains the pipeline of the data download from the ftp-server for the application on whole chromosome 16. 

* The chromosome was split in 200 parts, converted to fasta files and then LDJump was run on the fasta-file. 
* The constant estimated recombination rates are stored in a vector which is filled up until the whole chromosome is parsed. 
* Hence, smuce was applied to this vector in order to receive the estimated recombination map. 
* These steps are applied for all four populations. 

<!----- # Data Management for Human Chromosome 21 

* We downloaded the *vcf*-File for the populations of TSI, FIN, GBR, and IBS from [here](<http://phase3browser.1000genomes.org/Homo_sapiens/Location/Overview?r=21:41187000-41290679>) by using the "Get VCF Data" option. 
* We applied the *vcf2DNAbin* function from the R-package *vcfR* on the loaded *vcf*-file in the workspace. 
* Then we created the *fasta*-file with the *write.dna* function from the *ape* R-package. Therefore, also the reference file was downloaded as fasta-file from [here](<http://phase3browser.1000genomes.org/Homo_sapiens/Location/Overview?r=21:41187000-41290679>) by using the "Export Data" option. 
----->

.... under construction .....
