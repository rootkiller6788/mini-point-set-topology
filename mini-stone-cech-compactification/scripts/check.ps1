# PowerShell script to check mini-stone-cech-compactification package
# Run from the package root directory

$ErrorActionPreference = "Stop"
Write-Host "=== mini-stone-cech-compactification: Package Check ===" -ForegroundColor Cyan

# Count files
$totalFiles = (Get-ChildItem -Recurse -File | Measure-Object).Count
Write-Host "Total files: $totalFiles (target: 48)" -ForegroundColor $(if ($totalFiles -eq 48) { "Green" } else { "Yellow" })

# Check key files exist
$required = @(
    "lakefile.lean",
    "lean-toolchain",
    ".gitignore",
    "LICENSE",
    "MiniStoneCechCompactification.lean"
)

foreach ($f in $required) {
    if (Test-Path $f) {
        Write-Host "  [OK] $f" -ForegroundColor Green
    } else {
        Write-Host "  [MISSING] $f" -ForegroundColor Red
    }
}

# Check source modules
$srcDir = "MiniStoneCechCompactification"
$sourceModules = @(
    "Core\Basic.lean", "Core\Laws.lean", "Core\Objects.lean",
    "Morphisms\Hom.lean", "Morphisms\Iso.lean", "Morphisms\Equiv.lean",
    "Constructions\Products.lean", "Constructions\Quotients.lean",
    "Constructions\Subobjects.lean", "Constructions\Universal.lean",
    "Properties\Invariants.lean", "Properties\Preservation.lean",
    "Properties\ClassificationData.lean",
    "Theorems\Basic.lean", "Theorems\Classification.lean",
    "Theorems\Main.lean", "Theorems\UniversalProperties.lean",
    "Examples\Standard.lean", "Examples\Counterexamples.lean",
    "Bridges\ToAlgebra.lean", "Bridges\ToTopology.lean",
    "Bridges\ToGeometry.lean", "Bridges\ToComputation.lean"
)
$srcCount = 0
foreach ($m in $sourceModules) {
    if (Test-Path "$srcDir\$m") { $srcCount++ }
}
Write-Host "Source modules: $srcCount/23" -ForegroundColor $(if ($srcCount -eq 23) { "Green" } else { "Yellow" })

# Count #eval entries
$evalCount = (Select-String -Path "$srcDir\**\*.lean" -Pattern "#eval" | Measure-Object).Count
Write-Host "#eval entries: $evalCount" -ForegroundColor Green

# Count sorry entries
$sorryCount = (Select-String -Path "$srcDir\**\*.lean" -Pattern "sorry" | Measure-Object).Count
Write-Host "sorry markers: $sorryCount" -ForegroundColor Cyan

Write-Host "=== Check complete ===" -ForegroundColor Cyan
