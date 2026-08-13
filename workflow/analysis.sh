#!/usr/bin/env bash
# Use bactopia to analyze a single sample from SRA or ENA
bactopia \
    --accession SRX4563634 \
    --coverage 100 \
    --genome_size 2800000 \
    --max_cpus 2 \
    --outdir ena-single-sample