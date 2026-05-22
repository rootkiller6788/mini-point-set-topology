#!/usr/bin/env bash
# Setup script for mini-separation-axioms
# Ensures dependencies are available and builds the package.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"

echo "Setting up mini-separation-axioms..."
echo "Project directory: $PROJECT_DIR"

# Check if lake is available
if ! command -v lake &> /dev/null; then
    echo "Error: 'lake' not found. Please install Lean 4."
    exit 1
fi

# Navigate to project directory
cd "$PROJECT_DIR"

# Get dependencies
echo "Fetching dependencies..."
lake update 2>/dev/null || echo "  (lake update skipped)"

# Build the package
echo "Building package..."
lake build

echo "Setup complete."
