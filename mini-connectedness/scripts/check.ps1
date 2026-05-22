# Smoke check script for mini-connectedness
Write-Output "mini-connectedness check..."
lake build 2>&1
if ($LASTEXITCODE -eq 0) { Write-Output "BUILD OK" } else { Write-Output "BUILD FAILED" }
