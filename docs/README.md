# API Documentation

This directory contains the OpenAPI specification and tools to generate human-readable HTML documentation for the Todo Application API.

## Files

- `api-spec.yaml` - OpenAPI 3.0+ specification for the Todo API
- `generate-docs.js` - Node.js script to generate HTML documentation
- `package.json` - Dependencies and scripts for documentation generation
- `api-docs.html` - Generated HTML documentation (created after running build)

## Quick Start

### Generate Documentation

1. **Install dependencies** (first time only):
   ```bash
   cd docs
   npm install
   ```

2. **Generate HTML documentation**:
   ```bash
   npm run build
   ```

3. **View documentation**:
   - Open `api-docs.html` in your browser, OR
   - Serve locally: `npm run serve` (opens at http://localhost:8080)

### One-command setup:
```bash
npm run dev  # Builds and serves documentation
```

## Build Scripts

From the project root, you can use the convenience scripts:

**Linux/Mac:**
```bash
./scripts/build-docs.sh           # Generate documentation
./scripts/build-docs.sh --serve   # Generate and serve
```

**Windows:**
```batch
scripts\build-docs.bat           # Generate documentation
scripts\build-docs.bat --serve   # Generate and serve
```

## Features

The generated HTML documentation includes:

- **Interactive API Explorer** - Test endpoints directly in the browser
- **Searchable Interface** - Find endpoints and schemas quickly  
- **Beautiful Design** - Clean, professional appearance using Redoc
- **Mobile Responsive** - Works on all device sizes
- **Download Options** - Export OpenAPI spec in various formats
- **Code Examples** - Request/response examples in multiple languages

## Updating Documentation

1. Edit `api-spec.yaml` to update the API specification
2. Run `npm run build` to regenerate the HTML documentation
3. The HTML file is self-contained and can be hosted anywhere

## Technology Stack

- **Redoc** - Documentation generator for OpenAPI specifications
- **Node.js** - Build tooling and local development server
- **OpenAPI 3.0+** - API specification standard