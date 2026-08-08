# Phylogenetic Trees

This directory holds maximum-likelihood phylogenetic trees inferred by IQ-TREE from core genome alignments.

## Expected outputs

- `*.treefile` -- best-scoring ML tree in Newick format
- `*.iqtree` -- full IQ-TREE report (model parameters, log-likelihood, bootstrap values)
- `*.contree` -- consensus tree with bootstrap support values
- `*.log` -- IQ-TREE run log

Tree files are excluded from version control. To regenerate, run the phylogenetic inference step of the pipeline after Bactopia core processing is complete.
