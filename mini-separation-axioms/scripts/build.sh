#!/usr/bin/env bash
# Build script for mini-separation-axioms
# Performs clean build and reports results.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_DIR"

echo "Building mini-separation-axioms..."

# Clean build
lake clean 2>/dev/null || true
lake build 2>&1

echo ""
echo "Build complete."
echo "File count:"
find . -name "*.lean" | wc -l
echo "Lean files in package."
