#!/bin/bash
# Smoke check script for mini-connectedness
echo "mini-connectedness check..."
lake build 2>&1
if [ $? -eq 0 ]; then echo "BUILD OK"; else echo "BUILD FAILED"; fi
