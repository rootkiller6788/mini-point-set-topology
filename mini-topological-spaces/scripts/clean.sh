#!/bin/bash
# Clean MiniTopologicalSpaces build artifacts
set -euo pipefail
echo "Cleaning MiniTopologicalSpaces..."
cd "$(dirname "$0")/.."
lake clean
echo "MiniTopologicalSpaces clean complete."
