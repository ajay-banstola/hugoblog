# GitHub Pages 404 Fix - Custom Domain Issue

## Problem

Your site at `https://ajaybanstola.com.np/` is showing a 404 error because the **CNAME file is missing** from the deployed site.

## Solution Applied

✅ **Created CNAME file** in `static/CNAME` with content: `ajaybanstola.com.np`

Hugo will automatically copy files from the `static/` folder to the root of the `public/` directory during build.

## Next Steps

### 1. Rebuild and Deploy

```powershell
cd C:\Users\Admin\Desktop\personal_website\hugoblog\thebestblog
.\deploy.ps1
```

This will:
- Build the site (CNAME will be copied to `public/`)
- Deploy to the `ajay` branch
- GitHub Pages will recognize the custom domain

### 2. Verify CNAME is Deployed

After deployment, check that the CNAME file is in the `ajay` branch:

```powershell
cd public
git status
git log --oneline -1
```

Or check on GitHub:
- Go to: `https://github.com/ajay-banstola/ajaybanstola.github.io/tree/ajay`
- Verify `CNAME` file exists in the root

### 3. Check GitHub Pages Settings

1. Go to: `https://github.com/ajay-banstola/ajaybanstola.github.io/settings/pages`
2. Verify:
   - **Source**: `ajay` branch
   - **Custom domain**: `ajaybanstola.com.np`
   - Status should show "Your site is live at..."

### 4. DNS Configuration

Make sure your DNS is configured correctly:

**Type A Records** (or CNAME):
```
@ → 185.199.108.153
@ → 185.199.109.153
@ → 185.199.110.153
@ → 185.199.111.153
```

Or **CNAME Record**:
```
@ → ajay-banstola.github.io
```

### 5. Wait for Propagation

After deploying:
- DNS changes: 5 minutes to 48 hours
- GitHub Pages: Usually 1-10 minutes
- Clear browser cache: Ctrl+F5

## Common Issues

### Still 404 After Deploy?

1. **Check branch**: GitHub Pages must be set to `ajay` branch
2. **Verify CNAME**: Must be in root of `ajay` branch
3. **DNS Check**: Verify DNS is pointing to GitHub Pages
4. **HTTPS**: GitHub Pages may take time to provision SSL certificate

### Domain Not Verifying?

1. Check DNS propagation: https://dnschecker.org/
2. Remove and re-add custom domain in GitHub Pages settings
3. Wait 24-48 hours for DNS to fully propagate

### Site Works on GitHub.io but Not Custom Domain?

- DNS might not be configured
- CNAME file might be missing
- GitHub Pages might need time to update

## Verification Commands

```powershell
# Check CNAME exists locally
cd C:\Users\Admin\Desktop\personal_website\hugoblog\thebestblog\public
Test-Path CNAME
Get-Content CNAME

# Check it's on GitHub
git ls-remote origin ajay
```

## Quick Fix Summary

1. ✅ CNAME file created in `static/CNAME`
2. ⏳ **You need to**: Run `.\deploy.ps1` to rebuild and deploy
3. ⏳ **Then**: Verify on GitHub that CNAME is in the `ajay` branch
4. ⏳ **Wait**: 5-10 minutes for GitHub Pages to update

After deployment, your site should work at `https://ajaybanstola.com.np/`! 🚀

