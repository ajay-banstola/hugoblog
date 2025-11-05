# Hugo Installation Guide for Windows

## Important Note

**Hugo is NOT a Python package** - it's a standalone binary written in Go. You do **NOT need** a Python virtual environment (venv) for Hugo.

## Installation Options

### Option 1: Using Chocolatey (Recommended - Easiest)

If you have Chocolatey package manager:

```powershell
choco install hugo-extended
```

### Option 2: Using Scoop

If you have Scoop package manager:

```powershell
scoop install hugo-extended
```

### Option 3: Manual Installation (Most Reliable)

1. **Download Hugo Extended**:
   - Go to: https://github.com/gohugoio/hugo/releases
   - Download the latest `hugo_extended_X.X.X_windows-amd64.zip` file

2. **Extract the zip file**:
   - Extract `hugo.exe` from the zip

3. **Add to PATH**:
   - Option A (Temporary - current session only):
     ```powershell
     $env:Path += ";C:\path\to\hugo\directory"
     ```
   
   - Option B (Permanent):
     1. Right-click "This PC" → Properties
     2. Click "Advanced system settings"
     3. Click "Environment Variables"
     4. Under "System variables", find "Path" and click "Edit"
     5. Click "New" and add the folder path where `hugo.exe` is located
     6. Click OK on all dialogs

4. **Verify installation**:
   ```powershell
   hugo version
   ```

### Option 4: Using Go (if you have Go installed)

```powershell
go install -tags extended github.com/gohugoio/hugo@latest
```

## Verify Installation

After installation, verify it works:

```powershell
hugo version
```

You should see output like:
```
hugo v0.XXX.X+extended windows/amd64 BuildDate=...
```

**Important**: Make sure you install `hugo-extended` (not just `hugo`) because your theme (PaperMod) requires the extended version for SCSS/SASS support.

## What You Need

For your Hugo blog setup, you only need:

1. ✅ **Hugo Extended** (the static site generator)
2. ✅ **Git** (for version control and deployment)
3. ✅ **Git Bash or WSL** (for running bash scripts, OR use PowerShell script)

You do **NOT** need:
- ❌ Python
- ❌ Virtual environment (venv)
- ❌ Node.js (unless your theme requires it)
- ❌ npm/yarn

## Quick Test

Once Hugo is installed, test it:

```powershell
cd hugoblog/thebestblog
hugo version
hugo server
```

Then visit `http://localhost:1313` in your browser.

## Troubleshooting

### "hugo: command not found"

- Make sure Hugo is added to your PATH
- Restart your terminal/PowerShell after adding to PATH
- Try using the full path: `C:\path\to\hugo.exe version`

### "Hugo version shows but hugo server fails"

- Make sure you installed `hugo-extended`, not just `hugo`
- Your PaperMod theme requires the extended version

### "Theme not found" errors

Make sure the submodules are initialized:
```powershell
cd hugoblog
git submodule update --init --recursive
```

## Next Steps

After installing Hugo:

1. **Preview your site**:
   ```powershell
   cd hugoblog/thebestblog
   hugo server
   ```

2. **Build your site**:
   ```powershell
   hugo --baseURL=https://ajaybanstola.com.np/
   ```

3. **Deploy**:
   ```powershell
   .\deploy.ps1
   ```
   or
   ```bash
   bash deploy.sh
   ```

