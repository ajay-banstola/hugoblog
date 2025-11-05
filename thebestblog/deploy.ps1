# PowerShell deployment script for Hugo blog

# Function to check git status in a given directory and prompt for commit
function Check-And-Commit {
    param(
        [string]$Dir,
        [string]$Branch
    )
    
    # Navigate to the specified directory
    Push-Location $Dir
    
    try {
        # Display the git status
        Write-Host "Git status in ${Dir}:" -ForegroundColor Cyan
        git status
        
        # Check if there are changes
        $status = git status --porcelain
        if ($status) {
            Write-Host "Changes detected in ${Dir}." -ForegroundColor Yellow
            
            # Prompt to decide whether to commit and push
            $answer = Read-Host "Do you want to commit and push changes in ${Dir}? (y/n)"
            if ($answer -eq "y") {
                git add .
                git commit -m "$commitMessage"
                git push origin $Branch
            } else {
                Write-Host "Skipping commit and push in ${Dir}." -ForegroundColor Gray
            }
        } else {
            Write-Host "No changes in ${Dir}." -ForegroundColor Green
        }
    } finally {
        Pop-Location
    }
}

# Prompt for a commit message
$commitMessage = Read-Host "Enter commit message"

# Step 1: Check git status, commit, and push changes in the main project directory
Check-And-Commit "." "main"

# Step 2: Run Hugo to build the site (without running a server)
Write-Host "`nBuilding site with Hugo..." -ForegroundColor Cyan
# Clean the public directory first to avoid stale files (preserve .git for submodule)
if (Test-Path "public") {
    # Remove all files and folders except .git (important for submodules)
    Get-ChildItem "public" -Exclude ".git" | Remove-Item -Recurse -Force
    Write-Host "Cleaned public directory" -ForegroundColor Gray
}
hugo --environment production --baseURL=https://ajaybanstola.com.np/ --minify

if ($LASTEXITCODE -ne 0) {
    Write-Host "Hugo build failed!" -ForegroundColor Red
    exit 1
}

# Step 3: Check git status, commit, and push changes in the 'public' directory
Check-And-Commit "public" "ajay"

Write-Host "`nDeployment complete!" -ForegroundColor Green
