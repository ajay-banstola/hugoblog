# PowerShell script to download and install Hugo Extended on Windows

Write-Host "Hugo Extended Installation Script" -ForegroundColor Cyan
Write-Host "==================================`n" -ForegroundColor Cyan

# Check if Hugo is already installed
if (Get-Command hugo -ErrorAction SilentlyContinue) {
    Write-Host "Hugo is already installed!" -ForegroundColor Green
    hugo version
    exit 0
}

# Create a directory for Hugo
$hugoDir = "$env:USERPROFILE\hugo"
$hugoExe = "$hugoDir\hugo.exe"

if (-not (Test-Path $hugoDir)) {
    New-Item -ItemType Directory -Path $hugoDir | Out-Null
    Write-Host "Created directory: $hugoDir" -ForegroundColor Green
}

# Get latest Hugo release info
Write-Host "Fetching latest Hugo release information..." -ForegroundColor Yellow
try {
    $releases = Invoke-RestMethod -Uri "https://api.github.com/repos/gohugoio/hugo/releases/latest"
    $latestVersion = $releases.tag_name
    Write-Host "Latest version: $latestVersion" -ForegroundColor Green
    
    # Find the Windows extended version
    $asset = $releases.assets | Where-Object { $_.name -like "*windows-amd64.zip" -and $_.name -like "*extended*" } | Select-Object -First 1
    
    if (-not $asset) {
        Write-Host "Error: Could not find Hugo Extended for Windows" -ForegroundColor Red
        exit 1
    }
    
    $downloadUrl = $asset.browser_download_url
    $zipFile = "$hugoDir\hugo.zip"
    
    Write-Host "`nDownloading Hugo Extended from: $downloadUrl" -ForegroundColor Yellow
    Write-Host "This may take a minute..." -ForegroundColor Gray
    
    # Download Hugo
    Invoke-WebRequest -Uri $downloadUrl -OutFile $zipFile -UseBasicParsing
    
    Write-Host "Download complete!" -ForegroundColor Green
    
    # Extract Hugo
    Write-Host "Extracting Hugo..." -ForegroundColor Yellow
    Expand-Archive -Path $zipFile -DestinationPath $hugoDir -Force
    
    # Clean up zip file
    Remove-Item $zipFile
    
    Write-Host "Extraction complete!" -ForegroundColor Green
    
} catch {
    Write-Host "Error downloading Hugo: $_" -ForegroundColor Red
    Write-Host "`nPlease download manually from: https://github.com/gohugoio/hugo/releases/latest" -ForegroundColor Yellow
    Write-Host "Look for: hugo_extended_X.X.X_windows-amd64.zip" -ForegroundColor Yellow
    exit 1
}

# Check if hugo.exe exists
if (Test-Path $hugoExe) {
    Write-Host "`nHugo installed successfully at: $hugoExe" -ForegroundColor Green
    
    # Check if already in PATH
    $currentPath = $env:Path
    if ($currentPath -notlike "*$hugoDir*") {
        Write-Host "`nAdding Hugo to PATH..." -ForegroundColor Yellow
        
        # Add to user PATH
        $userPath = [Environment]::GetEnvironmentVariable("Path", "User")
        if ($userPath -notlike "*$hugoDir*") {
            [Environment]::SetEnvironmentVariable("Path", "$userPath;$hugoDir", "User")
            Write-Host "Added to PATH. You may need to restart your terminal." -ForegroundColor Green
        }
        
        # Add to current session
        $env:Path += ";$hugoDir"
    }
    
    # Verify installation
    Write-Host "`nVerifying installation..." -ForegroundColor Yellow
    & $hugoExe version
    
    Write-Host "`n✅ Hugo Extended is now installed!" -ForegroundColor Green
    Write-Host "`nNext steps:" -ForegroundColor Cyan
    Write-Host "1. If you just added it to PATH, restart your terminal/PowerShell" -ForegroundColor White
    Write-Host "2. Test with: hugo version" -ForegroundColor White
    Write-Host "3. Preview your site: cd hugoblog/thebestblog && hugo server" -ForegroundColor White
    
} else {
    Write-Host "Error: hugo.exe not found after installation" -ForegroundColor Red
    exit 1
}

