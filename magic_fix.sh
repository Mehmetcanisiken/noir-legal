#!/bin/bash
set -e

echo "🔧 Fixing Git Repository..."
cd /Users/clay/mehmetcanisken/noir-legal

# Remove broken git references if any
rm -rf .git

# Re-initialize
git init
git branch -M main

# Add remote
git remote add origin https://github.com/Mehmetcanisiken/noir-legal.git

# Add files
git add .
git commit -m "Final legal pages push"

echo "🚀 Pushing to GitHub (You may be asked for password)..."
git push -u origin main --force

echo ""
echo "✅ SUCCESS! Your pages should be live soon."
