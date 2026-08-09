[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](./LICENSE)

# Bactopia Bacterial Phyloresistomics Workflow

A reproducible, Nextflow-based workflow for integrated phylogenomic and resistome profiling of bacterial pathogens. This pipeline leverages [Bactopia](https://bactopia.github.io/) as its core analytical engine, combining automated genome assembly, annotation, multi-locus sequence typing, and antimicrobial resistance gene detection into a single, end-to-end framework.

## Rationale

Whole-genome sequencing has become the standard for characterising bacterial pathogens in both clinical and epidemiological settings. However, transforming raw sequencing reads into interpretable genomic profiles (sequence types, resistance determinants, phylogenetic placement) typically requires the execution of numerous standalone tools, each with its own installation, parameterisation, and output format. Bactopia addresses this complexity by wrapping over 150 bioinformatics tools into a unified Nextflow pipeline, ensuring reproducibility and scalability from single isolates to population-scale datasets.

This repository extends the standard Bactopia workflow with downstream phylogenetic reconstruction (via IQ-TREE) and resistome matrix generation, enabling the joint analysis of evolutionary relationships and antimicrobial resistance across strain collections.

## Analytical Overview

The pipeline proceeds through three major phases:

**Phase 1: Bactopia Core Processing.**
Raw paired-end Illumina reads (or SRA/ENA accessions) are processed through quality control (fastp), de novo assembly (Shovill/SPAdes), gene annotation (Prokka), genomic sketching (Mash, Sourmash), MLST typing, and AMR gene detection (AMRFinderPlus). Each module produces standardised per-sample outputs that are merged into cohort-level summary tables.

**Phase 2: Phylogenetic Reconstruction.**
Core genome alignments derived from the pangenome analysis are used to infer maximum-likelihood phylogenies with IQ-TREE. Model selection follows established best practices for protein-level core genome alignments, balancing statistical rigour with computational efficiency.

**Phase 3: Resistome Profiling and Visualisation.**
AMRFinderPlus output is parsed into binary presence/absence matrices and quantitative identity matrices, suitable for heatmap visualisation and statistical analysis. R scripts using tidyverse and ComplexHeatmap generate publication-quality figures that overlay resistance profiles onto the phylogenetic tree.

## Validation

The pipeline has been validated using a publicly available *Staphylococcus aureus* isolate (SRA accession SRX4563634), which was typed as **ST8** (Clonal Complex 8) with a perfect MLST score across all seven housekeeping loci. The resistome analysis detected the hallmark gene cassette of the CA-MRSA USA300 lineage, including *mecA* (methicillin resistance), the *blaZ/blaI/blaR1* penicillinase operon, macrolide resistance genes *mph(C)* and *msr(A)*, aminoglycoside resistance determinants *aph(3')-IIIa* and *ant(6)-Ia*, and the Panton-Valentine leukocidin virulence factor *lukS-PV*. These results are internally consistent and concordant with the published genomic characterisation of USA300 strains (Diep et al., 2006; Planet et al., 2015).

## Directory Layout

```
bactopia-bacterial-phyloresistomics-pipeline/
|
|-- config/                      # Pipeline configuration
|   |-- params.yaml              # Bactopia and downstream tool parameters
|   +-- samples.tsv              # Sample manifest (accessions or local paths)
|
|-- data/                        # Input data (git-ignored)
|   |-- raw_fastq/               # Raw paired-end FASTQ files
|   +-- metadata/                # Sample metadata and clinical annotations
|
|-- workflow/                    # Analysis scripts (executed sequentially)
|   |-- install.sh               # Conda environment setup for Bactopia
|   |-- test.sh                  # Quick validation with Bactopia test profile
|   +-- analysis.sh              # Main analysis entry point
|
|-- results/                     # Pipeline outputs (git-ignored where large)
|   |-- bactopia_output/         # Per-sample and merged Bactopia results
|   |-- phylo_trees/             # Newick trees and IQ-TREE log files
|   |-- resistome_matrices/      # AMR presence/absence and identity matrices
|   +-- publication_figures/     # Final figures for manuscript or reporting
|
|-- environment.yml              # Conda environment for downstream tools
|-- LICENSE                      # MIT License
+-- README.md                    # This file
```

## Prerequisites

- **Conda or Mamba** (for environment management)
- **Nextflow** >= 21.10 (installed automatically by Bactopia)
- **Docker, Singularity, or Conda** (for containerised tool execution within Bactopia)

## Quick Start

**1. Install Bactopia.**

```bash
bash workflow/install.sh
conda activate bactopia
```

**2. Verify the installation** with the built-in test profile.

```bash
bash workflow/test.sh
```

**3. Create the downstream analysis environment.**

```bash
conda env create -f environment.yml
conda activate phyloresistomics_env
```

**4. Prepare your sample manifest.** Populate `config/samples.tsv` with SRA/ENA accessions or local FASTQ paths. See the [Bactopia documentation](https://bactopia.github.io/) for the expected format.

**5. Run the analysis.**

```bash
bash workflow/analysis.sh
```

## Dependencies

The `environment.yml` file specifies the following key dependencies for downstream analysis:

| Tool | Version | Purpose |
|---|---|---|
| Python | >= 3.10 | Scripting and data manipulation |
| IQ-TREE | >= 2.2.0 | Maximum-likelihood phylogenetic inference |
| BioPython | latest | Sequence parsing and tree manipulation |
| pandas | latest | Tabular data processing |
| R | >= 4.2 | Statistical computing |
| tidyverse | latest | Data wrangling and visualisation |
| ComplexHeatmap | latest | Publication-quality heatmaps |

Bactopia and its internal tool dependencies are installed separately via `workflow/install.sh` and managed through Bactopia's own containerisation system.

## References

- Petit, R. A., III, and Read, T. D. (2020). Bactopia: a flexible pipeline for complete analysis of bacterial genomes. *mSystems*, 5(4), e00190-20.
- Diep, B. A., et al. (2006). Complete genome sequence of USA300, an epidemic clone of community-acquired meticillin-resistant *Staphylococcus aureus*. *The Lancet*, 367(9512), 731-739.
- Planet, P. J., et al. (2015). Architecture of a species: phylogenomics of *Staphylococcus aureus*. *Trends in Microbiology*, 23(10), 615-627.
- Feldgarden, M., et al. (2019). AMRFinderPlus and the Reference Gene Catalog facilitate examination of the genomic links among antimicrobial resistance, stress response, and virulence. *Scientific Reports*, 9(1), 6128.
- Minh, B. Q., et al. (2020). IQ-TREE 2: new models and efficient methods for phylogenetic inference in the genomic era. *Molecular Biology and Evolution*, 37(5), 1530-1534.

## License

This project is licensed under the MIT License. Please see [LICENSE](./LICENSE) for details.
