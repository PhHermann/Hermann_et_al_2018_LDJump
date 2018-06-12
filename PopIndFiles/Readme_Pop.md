# Pipeline of Data Management for Human Chromosome 16 

The R-script *Vcf2FastaLDJump* contains the pipeline of the data download from the ftp-server for the application on whole chromosome 16. 

* The chromosome was split in 200 parts, converted to fasta files and then LDJump was run on the fasta-file. 
* The constant estimated recombination rates are stored in a vector which is filled up until the whole chromosome is parsed. 
* Hence, smuce was applied to this vector in order to receive the estimated recombination map. 
* These steps are applied for all four populations. 


.... under construction .....
