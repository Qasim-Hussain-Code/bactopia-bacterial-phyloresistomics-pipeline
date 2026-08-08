# Resistome Matrices

This directory holds AMR gene presence/absence and identity matrices derived from AMRFinderPlus output.

## Expected outputs

- `amr_presence_absence.tsv` -- binary matrix (samples x AMR genes)
- `amr_identity_matrix.tsv` -- percent identity matrix for detected AMR genes
- `virulence_presence_absence.tsv` -- binary matrix for virulence factors
- `stress_presence_absence.tsv` -- binary matrix for stress response genes

These matrices serve as input for heatmap visualisation and statistical analysis in Phase 3 of the pipeline.
