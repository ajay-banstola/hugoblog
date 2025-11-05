# Hugo Environment Configuration

Hugo has built-in environment support to distinguish between **production** and **development** builds.

## Environment Flags

### Default Behavior
- `hugo` (build command) → **production** environment
- `hugo server` → **development** environment

### Explicit Environment Flag
You can explicitly set the environment using the `--environment` (or `-e`) flag:

```powershell
# Production build
hugo --environment production --baseURL=https://ajaybanstola.com.np/

# Development build
hugo server --environment development
```

## Current Configuration

### Production Build (Deploy Script)
The `deploy.ps1` script uses:
```powershell
hugo --environment production --baseURL=https://ajaybanstola.com.np/ --minify
```

### Development Build (Local Preview)
For local development:
```powershell
hugo server
# Automatically uses 'development' environment
```

## Using Environment in Templates

You can check the environment in your templates:

```go
{{ if hugo.IsProduction }}
  <!-- Production-only content -->
{{ else }}
  <!-- Development-only content -->
{{ end }}
```

Or access the environment directly:
```go
{{ hugo.Environment }}  <!-- Returns "production" or "development" -->
```

## Environment-Specific Config Files (Optional)

You can create separate config files for different environments:

```
hugoblog/thebestblog/
├── hugo.toml          # Base config
├── config/
│   ├── production/
│   │   └── config.toml    # Production overrides
│   └── development/
│       └── config.toml     # Development overrides
```

Example `config/production/config.toml`:
```toml
[params]
  googleAnalytics = "G-XXXXXXXXXX"
  enableComments = true
```

Example `config/development/config.toml`:
```toml
[params]
  googleAnalytics = ""
  enableComments = false
```

When you run:
- `hugo --environment production` → Uses `hugo.toml` + `config/production/config.toml`
- `hugo server` (development) → Uses `hugo.toml` + `config/development/config.toml`

## Benefits

1. **Different baseURLs**: Production uses real domain, development uses localhost
2. **Analytics**: Only enable in production
3. **Debugging**: Show debug info only in development
4. **Optimization**: Minify only in production
5. **Content**: Show draft posts only in development

## Current Setup

Your `hugo.toml` has:
```toml
[params]
  env = 'production'  # This is a custom param, not Hugo's built-in environment
```

The `--environment production` flag ensures Hugo knows it's a production build, which affects:
- Asset minification
- Template behavior
- robots.txt generation
- Any `hugo.IsProduction` checks in templates

