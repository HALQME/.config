SCRIPT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "Linking files..."
find "$SCRIPT_DIR" -type f -not -path '*/.git/*' -not -path '*/.github/*' -not -name '*.sh' -not -name '.DS_Store' -not -name 'Makefile' -print0 | while IFS= read -r -d '' file; do
    mkdir -p "$(dirname "$HOME/${file#$SCRIPT_DIR/}")"
    ln -fsnv "$file" "$HOME/${file#$SCRIPT_DIR/}"
done
