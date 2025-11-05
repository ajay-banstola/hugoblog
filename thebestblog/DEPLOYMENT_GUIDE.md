# Hugo Blog Deployment Guide

## Overview

Your Hugo blog uses a **Git submodule** setup where:
- **Source code** is in `hugoblog/thebestblog/` (main Hugo project)
- **Generated site** goes to `hugoblog/thebestblog/public/` (Git submodule)
- The `public` submodule is linked to `ajaybanstola.github.io` repository on the `ajay` branch
- The `ajaybanstola.github.io` directory in your workspace root is a separate clone of the same repository

## Project Structure

```
personal_website/
├── hugoblog/
│   └── thebestblog/          # Hugo source code
│       ├── content/          # Your blog posts and pages
│       ├── layouts/          # Custom layouts
│       ├── static/           # Static files (images, PDFs)
│       ├── public/           # Git submodule → ajaybanstola.github.io (ajay branch)
│       ├── hugo.toml         # Hugo configuration
│       └── deploy.sh         # Deployment script
└── ajaybanstola.github.io/   # Separate clone (for reference/viewing)
```

## How It Works

1. **Hugo generates** static HTML files from your source content
2. **Generated files** go into the `public/` directory (which is a Git submodule)
3. **Deployment script** commits and pushes:
   - Source changes to `main` branch (hugoblog repo)
   - Generated site to `ajay` branch (ajaybanstola.github.io repo)

## Making Changes

### 1. Edit Content

Edit your blog posts in:
- `hugoblog/thebestblog/content/posts/` - Blog posts
- `hugoblog/thebestblog/content/_index.md` - Home page
- `hugoblog/thebestblog/content/portfolio/` - Portfolio pages

### 2. Edit Configuration

Edit `hugoblog/thebestblog/hugo.toml` for site settings:
- Base URL
- Title
- Theme settings
- Pagination

### 3. Add New Posts

Create new `.md` files in `hugoblog/thebestblog/content/posts/` or use:
```bash
cd hugoblog/thebestblog
hugo new posts/your-post-name.md
```

### 4. Preview Locally

Before deploying, preview your changes:
```bash
cd hugoblog/thebestblog
hugo server
```
Then visit `http://localhost:1313` in your browser.

## Deployment Process

### Option 1: Using the Deployment Script (Recommended)

The `deploy.sh` script automates the deployment:

```bash
cd hugoblog/thebestblog
bash deploy.sh
```

The script will:
1. Show git status in the main project
2. Ask if you want to commit and push source changes (to `main` branch)
3. Run Hugo to build the site
4. Show git status in the `public` submodule
5. Ask if you want to commit and push generated site (to `ajay` branch)

### Option 2: Manual Deployment

If you prefer manual control:

```bash
cd hugoblog/thebestblog

# 1. Commit source changes (if any)
git add .
git commit -m "Your commit message"
git push origin main

# 2. Build the site
hugo --baseURL=https://ajaybanstola.com.np/

# 3. Commit and push generated site
cd public
git add .
git commit -m "Update site"
git push origin ajay
cd ..
```

## Important Notes

### Submodule Status

The `public` directory is a Git submodule. If it appears empty or you get errors:

1. **Initialize the submodule** (if not already done):
   ```bash
   cd hugoblog
   git submodule update --init --recursive
   ```

2. **Update the submodule** (if needed):
   ```bash
   cd hugoblog/thebestblog
   git submodule update --remote public
   ```

### Branch Configuration

- **Source code**: Pushed to `main` branch of `hugoblog` repository
- **Generated site**: Pushed to `ajay` branch of `ajaybanstola.github.io` repository

### Hugo Configuration

The base URL is set to `https://ajaybanstola.com.np/` in `hugo.toml`. Make sure this matches your actual domain.

## Troubleshooting

### "public directory is empty"

The submodule might not be initialized:
```bash
cd hugoblog
git submodule update --init --recursive
```

### "Changes not appearing after deployment"

1. Check that Hugo built successfully (no errors during `hugo` command)
2. Verify the `public` submodule is committed and pushed
3. Check GitHub Pages settings - ensure it's pointing to the `ajay` branch

### "Permission denied" errors

Make sure your SSH keys are set up for GitHub:
```bash
ssh -T git@github.com
```

### Windows PowerShell Issues

The `deploy.sh` script is a bash script. On Windows, you can:
- Use Git Bash (recommended)
- Use WSL (Windows Subsystem for Linux)
- Or convert to a PowerShell script

## Quick Reference

| Task | Command |
|------|---------|
| Preview locally | `cd hugoblog/thebestblog && hugo server` |
| Build site | `cd hugoblog/thebestblog && hugo` |
| Deploy | `cd hugoblog/thebestblog && bash deploy.sh` |
| Initialize submodule | `cd hugoblog && git submodule update --init --recursive` |
| Create new post | `cd hugoblog/thebestblog && hugo new posts/post-name.md` |

## Common Workflow

1. **Edit content** in `hugoblog/thebestblog/content/`
2. **Preview locally**: `hugo server`
3. **Test changes** in browser at `http://localhost:1313`
4. **Deploy**: `bash deploy.sh`
5. **Verify** changes on live site

Your site should be live at `https://ajaybanstola.com.np/` after deployment!
