#!/bin/bash
# Check that mini-separation-axioms builds correctly
set -e
echo "Building mini-separation-axioms..."
lake build
echo "Build succeeded."
lake env lean --run Test/Smoke.lean
