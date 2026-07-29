# Bactopia Bacterial Phyloresistomics Pipeline

An automated, reproducible workflow for bacterial pathogen genomics, combining **Bactopia (Nextflow)** execution with downstream **phylogenetic reconstruction** and **AMR resistome profiling**.

## Directory Layout
- `config/`: Sample manifests and pipeline parameters.
- `data/`: Raw input FASTQ reads and metadata (git-ignored).
- `workflow/`: Modular analysis scripts (Bactopia, IQ-TREE, R resistome mapping).
- `results/`: Processed output tables, phylogenetic trees, and figures.
- `docs/`: Hands-on workshop guides and tutorials.

## Quick Start
1. Create environment: `conda env create -f environment.yml`
2. Prepare samples manifest in `config/samples.tsv`
3. Execute Bactopia: `bash workflow/01_run_bactopia.sh`
