$headers = @{
    Authorization = "token YOUR_GITHUB_TOKEN"
    Accept = "application/vnd.github+json"
}

$body = @{
    branch = "main"
    source = "build"
} | ConvertTo-Json

try {
    $result = Invoke-RestMethod -Uri "https://api.github.com/repos/nagibmahmud/flood-prediction/pages" -Headers $headers -Method Post -Body $body -ContentType "application/json"
    Write-Host "GitHub Pages enabled!"
    Write-Host $result
} catch {
    Write-Host "Error: $_"
    Write-Host $_.Exception.Message
}
