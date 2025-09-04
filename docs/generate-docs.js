#!/usr/bin/env node

/**
 * Generate HTML documentation from OpenAPI specification
 * Uses Redoc to create a beautiful, interactive HTML documentation
 */

const fs = require('fs');
const path = require('path');

// Redoc standalone HTML template
const generateRedocHTML = (specPath, title = 'API Documentation') => {
  const specContent = fs.readFileSync(specPath, 'utf8');
  
  return `<!DOCTYPE html>
<html>
<head>
  <title>${title}</title>
  <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,700|Roboto:300,400,700" rel="stylesheet">
  <style>
    body {
      margin: 0;
      padding: 0;
    }
  </style>
</head>
<body>
  <div id="redoc-container"></div>
  <script src="https://cdn.jsdelivr.net/npm/js-yaml@4.1.0/dist/js-yaml.min.js"></script>
  <script src="https://cdn.redoc.ly/redoc/latest/bundles/redoc.standalone.js"></script>
  <script>
    const spec = ${JSON.stringify(specContent)};
    const parsedSpec = jsyaml.load(spec);
    
    Redoc.init(parsedSpec, {
      scrollYOffset: 0,
      hideDownloadButton: false,
      disableSearch: false,
      theme: {
        colors: {
          primary: {
            main: '#32329f'
          }
        },
        typography: {
          fontSize: '14px',
          lineHeight: '1.5em',
          code: {
            fontSize: '13px',
            fontFamily: 'Courier, monospace'
          },
          headings: {
            fontFamily: 'Montserrat, sans-serif',
            fontWeight: '400'
          }
        },
        menu: {
          width: '260px'
        }
      }
    }, document.getElementById('redoc-container'));
  </script>
</body>
</html>`;
};

// Main execution
const main = () => {
  const docsDir = __dirname;
  const specPath = path.join(docsDir, 'api-spec.yaml');
  const outputPath = path.join(docsDir, 'api-docs.html');

  console.log('🔍 Checking for API specification...');
  
  if (!fs.existsSync(specPath)) {
    console.error('❌ API specification not found at:', specPath);
    process.exit(1);
  }

  console.log('📝 Generating HTML documentation...');
  
  try {
    const html = generateRedocHTML(specPath, 'Todo API Documentation');
    fs.writeFileSync(outputPath, html);
    
    console.log('✅ Documentation generated successfully!');
    console.log('📄 File:', outputPath);
    console.log('🌐 Open in browser to view the documentation');
    
  } catch (error) {
    console.error('❌ Error generating documentation:', error.message);
    process.exit(1);
  }
};

if (require.main === module) {
  main();
}

module.exports = { generateRedocHTML };