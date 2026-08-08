# Raw FASTQ Reads

This directory holds raw paired-end Illumina sequencing reads (`.fastq.gz`) used as input to the Bactopia pipeline.

Files in this directory are excluded from version control due to their size. To reproduce the analysis, either:

1. Place your own FASTQ files here and reference them in `config/samples.tsv`, or
2. Use SRA/ENA accessions directly in the Bactopia command (see `workflow/analysis.sh`).

## Expected naming convention

```
{sample_name}_R1.fastq.gz
{sample_name}_R2.fastq.gz
```
