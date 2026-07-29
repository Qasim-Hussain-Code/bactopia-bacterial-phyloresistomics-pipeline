#!/usr/bin/env bash
set -e

# Usage: bash workflow/01_run_bactopia.sh
echo "=== Running Bactopia Pipeline ==="

bactopia \
  --samples config/samples.tsv \
  --outdir results/bactopia_output \
  --run_type default \
  --max_cpus 4 \
  --max_memory '8.GB'

echo "=== Bactopia Run Completed Successfully ==="
