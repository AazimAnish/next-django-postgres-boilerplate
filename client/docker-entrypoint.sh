#!/bin/sh

echo "Installing dependencies..."
npm install --legacy-peer-deps --include=optional

echo "Rebuilding native modules (lightningcss)..."
npm rebuild lightningcss

echo "Starting dev server..."
npm run dev
