# Configuration

This directory holds pipeline configuration files.

## Files

| File | Purpose |
|---|---|
| `params.yaml` | Bactopia and downstream tool parameters |
| `samples.tsv` | Sample manifest listing accessions or local FASTQ paths |

## Sample manifest format

The `samples.tsv` file follows the Bactopia sample sheet format. See the [Bactopia documentation](https://bactopia.github.io/) for column specifications. At minimum, each row should contain a sample name and either an SRA/ENA accession or paths to paired FASTQ files.
