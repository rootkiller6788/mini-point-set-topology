Write-Host "Checking mini-topological-constructions ..."
Write-Host "TODO: run lake build"
try {
  lake build 2>&1
} catch {
  Write-Host "Build failed (expected with sorry placeholders)"
}
