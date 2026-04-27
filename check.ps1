$r = Invoke-WebRequest -Uri "https://nagibmahmud.github.io/flood-prediction/index.html" -UseBasicParsing
$content = $r.Content
$start = $content.IndexOf("function predict()")
if ($start -gt 0) {
    $content.Substring($start, 600)
} else {
    "predict function not found"
}
