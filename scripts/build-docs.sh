#!/bin/bash

# Build API Documentation Script
# Generates HTML documentation from OpenAPI specification

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
DOCS_DIR="$PROJECT_ROOT/docs"

echo "🏗️  Building API Documentation..."
echo "📁 Project root: $PROJECT_ROOT"
echo "📄 Docs directory: $DOCS_DIR"

# Check if docs directory exists
if [ ! -d "$DOCS_DIR" ]; then
    echo "❌ Docs directory not found: $DOCS_DIR"
    exit 1
fi

# Check if API spec exists
if [ ! -f "$DOCS_DIR/api-spec.yaml" ]; then
    echo "❌ API specification not found: $DOCS_DIR/api-spec.yaml"
    exit 1
fi

# Navigate to docs directory
cd "$DOCS_DIR"

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
    echo "📦 Installing documentation dependencies..."
    npm install
fi

# Generate documentation
echo "📝 Generating HTML documentation..."
npm run build

# Check if documentation was generated
if [ -f "api-docs.html" ]; then
    echo "✅ Documentation generated successfully!"
    echo "📄 File: $DOCS_DIR/api-docs.html"
    echo ""
    echo "🌐 To view the documentation:"
    echo "   Option 1: Open $DOCS_DIR/api-docs.html in your browser"
    echo "   Option 2: Run 'npm run serve' in the docs directory"
    echo "   Option 3: Run this script with --serve flag"
else
    echo "❌ Documentation generation failed"
    exit 1
fi

# Serve documentation if --serve flag is provided
if [ "$1" = "--serve" ]; then
    echo ""
    echo "🚀 Starting documentation server..."
    npm run serve
fi