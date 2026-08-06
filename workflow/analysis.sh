#!/usr/bin/env bash
# Use bactopia to process a single sample from SRA/ENA
bactopia \
    --accession SRX4563634 \
    --coverage 100 \
    --genome_size 2800000 \
    --max_cpus 2 \
    --outdir ena-single-sample