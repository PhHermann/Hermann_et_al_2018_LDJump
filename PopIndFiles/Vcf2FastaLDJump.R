setwd("/data/SimuPH/GenomesData")
#### Download data for chromosomes 16 #####
system("wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/integrated_call_samples_v3.20130502.ALL.panel")
system("wget ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/release/20130502/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz")
require(VariantAnnotation)
require(vcfR)
require(ape)
require(LDJump)
require(BSgenome.Hsapiens.UCSC.hg19)

#### Download reference sequence for chromosomes 16 ####
getflank2 <- function(chr, start.position, end.position) { #
 rightflank <- getSeq(Hsapiens,chr, start.position, end.position)
 paste(rightflank,sep="")
}
ref.seq = as.DNAbin(DNAStringSet(getflank2(chr = "chr16", start.position=1, end.position = seqlengths(Hsapiens)[16])))

pops = c("TSI", "FIN", "GBR", "IBS")
len = 90330000
parts = 200
wid = len/parts

for(pop in pops) {
 result = list()
 rho.ests = rho.ests.demo = c()
 setwd(paste0("/data/SimuPH/GenomesData/",pop))
 for(i in 1:parts) {
  sta.bp = (i-1)*wid+1
  end.bp = i*wid
  system(paste0("/programs/vcftools/src/cpp/vcftools --gzvcf /data/SimuPH/GenomesData/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --chr 16 --from-bp ", as.integer(end.bp), " --to-bp ", as.integer(end.bp), " --keep /data/SimuPH/GenomesData/", pop, "_sel.id --recode --recode-INFO-all --out ", pop, "_sel_", as.integer(sta.bp), "_", as.integer(end.bp)))
  fileName = paste0(pop, "_sel_", as.integer(sta.bp), "_", as.integer(end.bp), ".recode.vcf")
  test = read.vcfR(file = fileName, limit = 1e+07, nrows = -1, skip = 0, cols = NULL, convertNA = F, verbose = T)
  pos.duplicates = which(duplicated(getID(test)))
   if(length(pos.duplicates > 0)) {test@fix[pos.duplicates,3] = sapply(1:length(pos.duplicates), function(x) {return(paste(test@fix[pos.duplicates[x],3], x, sep = "_"))})}
#  chr16.dnabin=vcfR2DNAbin(test,extract.indels=T,consensus=F,extract.haps=T,ref.seq=ref.seq[sta.bp:end.bp],start.pos = 1)
  chr16.dnabin=vcfR2DNAbin(test,extract.indels=F,ref.seq=ref.seq,start.pos = sta.bp)
  fileNameFasta = paste0(pop, "_chr16__sel", as.integer(sta.bp), "_", as.integer(end.bp), ".fa")
  write.dna(x = chr16.dnabin, file = fileNameFasta, format = "fasta", colsep = "")
  result[[i]] = LDJump(fileNameFasta, segLength = 1000, pathLDhat = "/programs/LDhat-master", cores = 7, demography = F, status = T, accept = T, thth = 0.01, alpha = 0.05)
  if(is.character(result[[i]][[1]]) {
   rho.ests = c(rho.ests, rep(0, 451))
   rho.ests.demo = c(rho.ests.demo, rep(0, 451))
  } else {
   rho.ests = c(rho.ests, result[[i]][[2]])
   rho.ests.demo = c(rho.ests.demo, get_smuce(help = result[[i]][[3]], segs = 451, alpha = 0.05, ll = 1000, quant = 0.35, constant = F, demography = T, rescale = F)[[2]])
  }
 save.image(paste0(pop, "_chr16_", as.integer(sta.bp), "_", as.integer(end.bp), ".RData"))
  print(paste0("Endend with: ", i, " of ", parts, "segments"))
 } # end parts
  objName = paste0(pops, ".rho.ests")
  objName.demo = paste0((pops, ".rho.ests.demo")
  assign(objName, rho.ests)
  assign(objName.demo, rho.ests.demo)
  assign(paste0(pops, ".smuce"), stepFit(get(objName), alpha = 0.05, family = "gauss", confband = T))
  assign(paste0(pops, ".smuce.demo"), stepFit(get(objName.demo), alpha = 0.05, family = "gauss", confband = T))

} # end pops



