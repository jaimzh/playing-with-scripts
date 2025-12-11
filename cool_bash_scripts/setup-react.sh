#!/usr/bin/env bash

set -e  # Fail immediately on errors

echo "====================================="
echo " React App Setup Wizard"
echo "====================================="
echo ""
echo "Choose project type:"
echo "1) React + TypeScript (Vite)"
echo "2) React + JavaScript (Vite)"
echo "3) Exit"

read -rp "Enter choice (1-3): " choice

if [ "$choice" = "3" ]; then
  echo "Exiting..."
  exit 0
fi

if [ "$choice" != "1" ] && [ "$choice" != "2" ]; then
  echo "Invalid choice."
  exit 1
fi

read -rp "Enter project name: " project_name
if [ -z "$project_name" ]; then
  echo "Project name cannot be empty."
  exit 1
fi

if [ -d "$project_name" ]; then
  echo "Directory already exists."
  exit 1
fi

echo ""
echo "Creating Vite project: $project_name"

if [ "$choice" = "1" ]; then
  npm create vite@latest "$project_name" -- --template react-ts
  config_file="vite.config.ts"
else
  npm create vite@latest "$project_name" -- --template react
  config_file="vite.config.js"
fi

cd "$project_name"
npm install

echo ""
echo "Installing Tailwind CSS (mandatory)..."
npm install -D tailwindcss @tailwindcss/vite

echo ""
echo "Configuring Tailwind in Vite config..."

# Insert plugin import + configuration
if [ -f "$config_file" ]; then
  # Replace config file contents to include Tailwind plugin
  cat > "$config_file" <<EOF
import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'
import tailwindcss from '@tailwindcss/vite'

export default defineConfig({
  plugins: [
    react(),
    tailwindcss(),
  ],
})
EOF
fi

echo ""
echo "Creating Tailwind CSS file..."

mkdir -p src
cat > src/style.css <<EOF
@import "tailwindcss";
EOF

# echo ""
# echo "Injecting CSS link in index.html (if not already present)..."

# index_file="index.html"

# if ! grep -q "style.css" "$index_file"; then
#   sed -i '' 's#</head>#  <link rel="stylesheet" href="/src/style.css">\n</head>#' "$index_file" 2>/dev/null \
#   || sed -i 's#</head>#  <link rel="stylesheet" href="/src/style.css">\n</head>#' "$index_file"
# fi

echo ""
echo "Tailwind setup complete."

# Optional shadcn/ui
echo ""
echo "Install shadcn/ui?"
echo "1) Yes"
echo "2) No"
read -rp "> " shadcn_choice

if [ "$shadcn_choice" = "1" ]; then
  echo "Installing dependencies for shadcn/ui..."
  npm install class-variance-authority clsx tailwind-merge lucide-react
  npm install -D shadcn-ui
fi

# Optional lucide-react
echo ""
echo "Install lucide-react?"
echo "1) Yes"
echo "2) No"
read -rp "> " lucide_choice

if [ "$lucide_choice" = "1" ]; then
  npm install lucide-react
fi

# Extra packages
echo ""
echo "Install extra packages (react-router-dom, axios, etc.)?"
echo "1) Yes"
echo "2) No"
read -rp "> " extra_choice

if [ "$extra_choice" = "1" ]; then
  read -rp "Enter packages (space-separated): " extras
  npm install $extras
fi

echo ""
echo "====================================="
echo " Setup Complete!"
echo " Project ready: $project_name"
echo " Run: cd $project_name && npm run dev"
echo "====================================="
