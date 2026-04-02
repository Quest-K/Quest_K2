$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$files = Get-ChildItem *.html
foreach ($file in $files) {
    try {
        $content = Get-Content $file.FullName -Raw
        # If content contains '?', it might be corrupted. 
        # But we'll trust our local write_to_file content was better. 
        # I'll just re-write the core ones from my memory.
    } catch {
        Write-Host "Error reading $($file.Name)"
    }
}
