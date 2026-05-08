$headers = @{
    Authorization = "token YOUR_GITHUB_TOKEN"
}

$content = Get-Content "index.html" -Raw
$bytes = [Text.Encoding]::UTF8.GetBytes($content)
$encoded = [Convert]::ToBase64String($bytes)

$existing = Invoke-RestMethod -Uri "https://api.github.com/repos/nagibmahmud/flood-prediction/contents/index.html" -Headers $headers
$sha = $existing.sha

$body = @{
    message = "Update flood prediction"
    content = $encoded
    sha = $sha
} | ConvertTo-Json

$result = Invoke-RestMethod -Uri "https://api.github.com/repos/nagibmahmud/flood-prediction/contents/index.html" -Headers $headers -Method Put -Body $body -ContentType "application/json"

Write-Host "Uploaded successfully!"
