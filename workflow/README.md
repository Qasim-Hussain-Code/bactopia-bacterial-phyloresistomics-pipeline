# Workflow Scripts

This directory contains the executable scripts that drive the phyloresistomics pipeline. Scripts are designed to be run sequentially.

## Scripts

| Script | Purpose |
|---|---|
| `install.sh` | Creates the Bactopia conda environment |
| `test.sh` | Validates the Bactopia installation using the built-in test profile |
| `analysis.sh` | Main entry point: runs Bactopia on the target sample(s) |

## Usage

```bash
# First-time setup
bash workflow/install.sh
conda activate bactopia

# Verify installation
bash workflow/test.sh

# Run the analysis
bash workflow/analysis.sh
```

Bactopia output from `analysis.sh` is written to the `--outdir` specified in the script. For production runs, redirect output to `results/bactopia_output/`.
