#!/bin/sh

echo "🔧 Rebuilding native modules (lightningcss)..."
npm rebuild lightningcss || true

echo "🚀 Starting dev server..."
exec "$@"
