# Deploy Script Explanation

Your deployment scripts automate the process of building and deploying your Hugo blog.

## deploy.ps1 (PowerShell - Windows)

### What it does:

1. **Prompts for commit message** - You enter a single message used for both repositories

2. **Step 1: Main repository (source code)**
   - Checks git status in the main project directory
   - Shows what files have changed
   - Asks if you want to commit and push to `main` branch
   - Pushes to `hugoblog` repository

3. **Step 2: Build site with Hugo**
   - Cleans the `public` directory (removes old files, keeps `.git`)
   - Builds with production settings:
     - `--environment production` - Sets production environment
     - `--baseURL=https://ajaybanstola.com.np/` - Production domain
     - `--minify` - Minifies CSS/JS for faster loading
   - Checks if build succeeded

4. **Step 3: Public repository (generated site)**
   - Checks git status in `public/` directory
   - Shows generated files
   - Asks if you want to commit and push to `ajay` branch
   - Pushes to `ajaybanstola.github.io` repository

### Usage:

```powershell
cd hugoblog/thebestblog
.\deploy.ps1
```

## deploy.sh (Bash - Linux/Mac/Git Bash)

Same functionality as PowerShell version, but for bash shell.

### Usage:

```bash
cd hugoblog/thebestblog
bash deploy.sh
```

## Key Features

✅ **Environment separation** - Uses `--environment production` for production builds  
✅ **Clean builds** - Removes old files before building to avoid stale content  
✅ **Minification** - Optimizes CSS/JS for production  
✅ **Error handling** - Stops if Hugo build fails  
✅ **Interactive** - Asks before committing/pushing  
✅ **Dual repository** - Handles both source and generated site repositories  

## What Gets Deployed

### Main Repository (`main` branch)
- Source Hugo files
- Content (`.md` files)
- Configuration (`hugo.toml`)
- Custom layouts
- Static assets (images, PDFs)

### Public Repository (`ajay` branch)
- Generated HTML files
- Compiled CSS/JS
- All static assets
- Everything needed to serve the site

## Troubleshooting

### "Hugo build failed!"
- Check that Hugo is installed
- Verify `hugo.toml` is valid
- Check for syntax errors in content files

### "Changes not appearing"
- Make sure you answered 'y' to commit and push
- Verify the `public` submodule is properly initialized
- Check GitHub Pages settings point to `ajay` branch

### "Permission denied"
- Ensure SSH keys are set up for GitHub
- Test with: `ssh -T git@github.com`

