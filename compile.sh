#!/bin/bash
# Compile LaTeX papers using Docker/Colima (no permanent installation needed)
# Volume mount ensures PDF is written directly to host filesystem

set -e

TEX_FILE="${1:-normalization_confluence_2026.tex}"
PDF_FILE="${TEX_FILE%.tex}.pdf"

if [ ! -f "$TEX_FILE" ]; then
    echo "Error: File '$TEX_FILE' not found"
    exit 1
fi

# Check if docker/colima is running
if ! docker info >/dev/null 2>&1; then
    echo "Error: Docker/Colima not running. Start with: colima start"
    exit 1
fi

echo "Compiling $TEX_FILE using Docker..."
echo "Output directory: $(pwd)"

# Pull image if not present (only happens once, ~4GB)
docker pull texlive/texlive:latest > /dev/null 2>&1 || true

# Run pdflatex twice (first for references, second to resolve)
# Volume mount: -v "$(pwd):/workdir" writes PDF directly to host
docker run --rm \
    -v "$(pwd):/workdir" \
    -w /workdir \
    texlive/texlive:latest \
    sh -c "pdflatex -interaction=nonstopmode '$TEX_FILE' && pdflatex -interaction=nonstopmode '$TEX_FILE'"

# Verify PDF was created on host filesystem
if [ -f "$PDF_FILE" ]; then
    PDF_SIZE=$(du -h "$PDF_FILE" | cut -f1)
    echo "✓ Success: $PDF_FILE ($PDF_SIZE) written to host"
    ls -lh "$PDF_FILE"
else
    echo "✗ Error: PDF not created at $(pwd)/$PDF_FILE"
    exit 1
fi

# Cleanup auxiliary files (keep PDF on host)
rm -f *.aux *.log *.out *.toc

echo "✓ Cleaned up auxiliary files"
echo "✓ PDF ready at: $(pwd)/$PDF_FILE"
