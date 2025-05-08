#!/usr/bin/env bash
# Run the BP nonce-word acceptability analysis

set -euo pipefail

echo "[$(date)] Starting BP nonce-word analysis..."
Rscript bp_nonce_analysis.R
echo "[$(date)] Analysis complete."
