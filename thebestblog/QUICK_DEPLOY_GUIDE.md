# Quick Deploy Guide - Production Deployment

## Prerequisites

1. **Hugo installed** - Make sure Hugo Extended is installed
   ```powershell
   hugo version
   ```
   If not installed, run: `.\install-hugo.ps1`

2. **Git configured** - SSH keys set up for GitHub
   ```powershell
   ssh -T git@github.com
   ```

3. **All changes committed** - Your content edits are ready

## Step-by-Step Deployment

### 1. Navigate to Project Directory

```powershell
cd C:\Users\Admin\Desktop\personal_website\hugoblog\thebestblog
```

### 2. Run the Deploy Script

```powershell
.\deploy.ps1
```

### 3. Follow the Prompts

The script will guide you through:

**Step 1: Enter Commit Message**
```
Enter commit message: Add new post about diffusion models
```

**Step 2: Main Repository (Source Code)**
- Shows git status
- Asks: `Do you want to commit and push changes in .? (y/n):`
- Type `y` to commit and push source code to `main` branch

**Step 3: Hugo Build**
- Automatically cleans `public` directory
- Builds site with production settings
- Shows build progress

**Step 4: Public Repository (Generated Site)**
- Shows git status of generated files
- Asks: `Do you want to commit and push changes in public? (y/n):`
- Type `y` to commit and push to `ajay` branch

**Step 5: Done!**
```
Deployment complete!
```

## What Happens Behind the Scenes

1. ✅ **Source code** → Pushed to `hugoblog` repository (`main` branch)
2. ✅ **Site built** → Hugo generates static files with production settings
3. ✅ **Generated site** → Pushed to `ajaybanstola.github.io` repository (`ajay` branch)
4. ✅ **GitHub Pages** → Automatically deploys from `ajay` branch

## Full Example Session

```powershell
PS C:\Users\Admin\Desktop\personal_website\hugoblog\thebestblog> .\deploy.ps1

Enter commit message: Add diffusion models post and fix menu

Git status in .:
On branch main
Changes not staged for commit:
  modified:   content/posts/diffusion-models-vs-llms.md
  modified:   hugo.toml

Changes detected in ..
Do you want to commit and push changes in .? (y/n): y
[Commits and pushes to main branch]

Building site with Hugo...
Cleaned public directory
Start building sites ...
hugo v0.152.2-1234567+extended windows/amd64 BuildDate=2024-01-01T00:00:00Z
Total in 234 ms

Git status in public:
On branch ajay
Changes not staged for commit:
  modified:   index.html
  modified:   posts/diffusion-models-vs-llms/index.html
  modified:   assets/css/stylesheet.xxx.css

Changes detected in public.
Do you want to commit and push changes in public? (y/n): y
[Commits and pushes to ajay branch]

Deployment complete!
```

## Troubleshooting

### "Hugo not found"
Install Hugo first:
```powershell
.\install-hugo.ps1
```

### "Permission denied" when pushing
Check SSH keys:
```powershell
ssh -T git@github.com
```

### "Hugo build failed!"
- Check for syntax errors in `hugo.toml`
- Verify content files are valid Markdown
- Check Hugo version: `hugo version` (need Extended version)

### "No changes detected"
- If you've already committed everything, this is normal
- The script will still build the site
- Only new/changed files will be included

## Verification

After deployment, check your live site:
- **Site URL**: https://ajaybanstola.com.np/
- **GitHub Pages**: Check the `ajay` branch in `ajaybanstola.github.io` repository

## Tips

- ✅ Always preview locally first: `hugo server`
- ✅ Test changes before deploying
- ✅ Use descriptive commit messages
- ✅ Deploy during off-peak hours if possible
- ✅ Check live site after deployment

## Manual Steps (if needed)

If the script fails, you can deploy manually:

```powershell
# 1. Commit source changes
git add .
git commit -m "Your message"
git push origin main

# 2. Build site
Remove-Item public\* -Recurse -Force -Exclude ".git"
hugo --environment production --baseURL=https://ajaybanstola.com.np/ --minify

# 3. Commit and push generated site
cd public
git add .
git commit -m "Update site"
git push origin ajay
cd ..
```

But using `.\deploy.ps1` is much easier! 🚀

