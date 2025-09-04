@echo off
REM Build API Documentation Script for Windows
REM Generates HTML documentation from OpenAPI specification

echo 🏗️  Building API Documentation...

set "SCRIPT_DIR=%~dp0"
set "PROJECT_ROOT=%SCRIPT_DIR%.."
set "DOCS_DIR=%PROJECT_ROOT%\docs"

echo 📁 Project root: %PROJECT_ROOT%
echo 📄 Docs directory: %DOCS_DIR%

REM Check if docs directory exists
if not exist "%DOCS_DIR%" (
    echo ❌ Docs directory not found: %DOCS_DIR%
    exit /b 1
)

REM Check if API spec exists
if not exist "%DOCS_DIR%\api-spec.yaml" (
    echo ❌ API specification not found: %DOCS_DIR%\api-spec.yaml
    exit /b 1
)

REM Navigate to docs directory
cd /d "%DOCS_DIR%"

REM Install dependencies if needed
if not exist "node_modules" (
    echo 📦 Installing documentation dependencies...
    call npm install
    if errorlevel 1 (
        echo ❌ Failed to install dependencies
        exit /b 1
    )
)

REM Generate documentation
echo 📝 Generating HTML documentation...
call npm run build
if errorlevel 1 (
    echo ❌ Documentation generation failed
    exit /b 1
)

REM Check if documentation was generated
if exist "api-docs.html" (
    echo ✅ Documentation generated successfully!
    echo 📄 File: %DOCS_DIR%\api-docs.html
    echo.
    echo 🌐 To view the documentation:
    echo    Option 1: Open %DOCS_DIR%\api-docs.html in your browser
    echo    Option 2: Run 'npm run serve' in the docs directory
    echo    Option 3: Run this script with --serve flag
) else (
    echo ❌ Documentation generation failed
    exit /b 1
)

REM Serve documentation if --serve flag is provided
if "%1"=="--serve" (
    echo.
    echo 🚀 Starting documentation server...
    call npm run serve
)