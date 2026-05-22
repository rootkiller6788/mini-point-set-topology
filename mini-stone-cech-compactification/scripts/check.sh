#!/usr/bin/env bash
# Shell script to check mini-stone-cech-compactification package
# Run from the package root directory

set -e
echo "=== mini-stone-cech-compactification: Package Check ==="

# Count files
total_files=$(find . -type f | wc -l)
echo "Total files: $total_files (target: 48)"

# Check key files exist
for f in lakefile.lean lean-toolchain .gitignore LICENSE MiniStoneCechCompactification.lean; do
    if [ -f "$f" ]; then
        echo "  [OK] $f"
    else
        echo "  [MISSING] $f"
    fi
done

# Check source modules
src_count=$(find MiniStoneCechCompactification -name "*.lean" -type f | wc -l)
echo "Source modules: $src_count/23"

# Count #eval entries
eval_count=$(grep -r "#eval" MiniStoneCechCompactification --include="*.lean" | wc -l)
echo "#eval entries: $eval_count"

# Count sorry entries
sorry_count=$(grep -r "sorry" MiniStoneCechCompactification --include="*.lean" | wc -l)
echo "sorry markers: $sorry_count"

echo "=== Check complete ==="
