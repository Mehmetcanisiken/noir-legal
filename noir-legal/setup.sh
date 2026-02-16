#!/bin/bash
echo "🚀 NOIR Legal Pages Setup Script"
echo "--------------------------------"

# Ensure we are in the right directory
cd "$(dirname "$0")"

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "📦 Initializing Git repository..."
    git init
    git branch -M main
fi

# Add all files
git add .
git commit -m "Initial commit: Legal pages for NOIR"

echo ""
echo "✅ Local repository setup complete."
echo ""
echo "👉 STEP 1: Go to https://github.com/new and create a PUBLIC repository named 'noir-legal'."
echo "   (Do not add README, license, or .gitignore)"
echo ""
echo "👉 STEP 2: Paste the repository URL below (e.g., https://github.com/username/noir-legal.git):"
read -r REPO_URL

if [ -z "$REPO_URL" ]; then
    echo "❌ No URL provided. Exiting."
    exit 1
fi

# Add remote
if git remote | grep -q origin; then
    git remote set-url origin "$REPO_URL"
else
    git remote add origin "$REPO_URL"
fi

echo "🚀 Pushing to GitHub..."
git push -u origin main

echo ""
echo "✅ Code pushed successfully!"
echo ""
echo "👉 STEP 3: Enable GitHub Pages"
echo "   1. Open $REPO_URL/settings/pages"
echo "   2. Source: 'Deploy from a branch'"
echo "   3. Branch: 'main', Folder: '/ (root)'"
echo "   4. Click Save"
echo ""
echo "🎉 Your site will be live at: https://<username>.github.io/noir-legal/"
echo "   (Wait 1-2 minutes for deployment)"
