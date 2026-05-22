#!/bin/bash
# Smoke check script for mini-compactness
echo "mini-compactness check..."
lake build 2>&1 && echo "BUILD OK" || echo "BUILD FAILED"
echo "mini-compactness smoke test..."
lake env lean --run Test/Smoke.lean 2>&1 && echo "SMOKE OK" || echo "SMOKE FAILED"
