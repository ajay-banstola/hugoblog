# Important: Rebuilding for Production

## Issue
The CSS is not loading on the live site because the `public` folder was built with `hugo server` (which uses localhost URLs) instead of the production baseURL.

## Solution

**Always use the deploy script for production builds:**

```powershell
.\deploy.ps1
```

This will:
1. Build with the correct baseURL (`https://ajaybanstola.com.np/`)
2. Clean the public directory first
3. Generate production-ready files

## Manual Build (if needed)

If you need to rebuild manually without deploying:

```powershell
# Clean public directory (keep .git)
Remove-Item public\* -Recurse -Force -Exclude ".git"

# Build with production baseURL
hugo --baseURL=https://ajaybanstola.com.np/ --minify
```

## Important Notes

- ❌ **Don't use `hugo server` output for deployment** - it uses localhost URLs
- ✅ **Always use `hugo --baseURL=https://ajaybanstola.com.np/`** for production
- ✅ **Use `.\deploy.ps1`** - it handles everything correctly

The CSS will work correctly on the live site after rebuilding with the production baseURL.

