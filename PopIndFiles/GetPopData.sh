#!/bin/bash
cwd=$(pwd)
cd /programs/vcftools/src/cpp
declare -a popNames=("GBR" "FIN" "IBS" "TSI")
for i in "${popNames[@]}"
do
grep "$i" /data/SimuPH/GenomesData/integrated_call_samples_v3.20130502.ALL.panel | cut -f1 > /data/SimuPH/GenomesData/"$i".id
./vcftools --gzvcf /data/SimuPH/GenomesData/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --keep /data/SimuPH/GenomesData/"$i".id --recode --recode-INFO-all --stdout | gzip -c >/data/SimuPH/GenomesData/Output_chr16_"$i"_New.vcf.gz
done

cd ${cwd}

/programs/vcftools/src/cpp/vcftools --gzvcf /data/SimuPH/GenomesData/ALL.chr16.phase3_shapeit2_mvncall_integrated_v5a.20130502.genotypes.vcf.gz --keep /data/SimuPH/GenomesData/GBR_sel.id --recode --recode-INFO-all --out GBR_sel

