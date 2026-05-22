# Smoke check script for mini-compactness (PowerShell)
Write-Host "mini-compactness check..."
try {
    lake build 2>&1
    Write-Host "BUILD OK"
} catch {
    Write-Host "BUILD FAILED"
}
Write-Host "mini-compactness smoke test..."
try {
    lake env lean --run Test/Smoke.lean 2>&1
    Write-Host "SMOKE OK"
} catch {
    Write-Host "SMOKE FAILED"
}
