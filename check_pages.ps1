$token = "YOUR_GITHUB_TOKEN"
$headers = @{
    Authorization = "token $token"
    Accept = "application/vnd.github+json"
}

try {
    $pages = Invoke-RestMethod -Uri "https://api.github.com/repos/nagibmahmud/flood-prediction/pages" -Headers $headers
    Write-Host "GitHub Pages Status:"
    $pages | ConvertTo-Json
} catch {
    Write-Host "Error getting pages: $_"
}

Write-Host "`nChecking files in repo:"
$contents = Invoke-RestMethod -Uri "https://api.github.com/repos/nagibmahmud/flood-prediction/contents/" -Headers $headers
$contents.name
