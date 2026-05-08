$r = Invoke-WebRequest -Uri "https://nagibmahmud.github.io/flood-prediction/test_predict.html" -UseBasicParsing
if ($r.Content -match "function predict\(\)") {
    Write-Host "SUCCESS: predict function found!"
    if ($r.Content -match "console\.log") {
        Write-Host "Console logging enabled"
    }
} else {
    Write-Host "FAIL: predict function not found"
}
