#!/bin/bash
# Build MiniTopologicalSpaces
set -euo pipefail
echo "Building MiniTopologicalSpaces..."
cd "$(dirname "$0")/.."
lake build "$@"
echo "MiniTopologicalSpaces build complete."
