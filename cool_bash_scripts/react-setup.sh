#! bin/sh 

set -e #to automatically end when there is an error 

echo "REACT SETUP" 
echo "Choose Project type:"
echo "1) React + TypeScript" 
echo "2) React + JavaScript" 
echo "3) Exit"

read -p "Enter choice (1-3):" choice

if [ "$choice" == "3" ]; then
    echo "Exiting..."
    exit 0
fi 

if [ "$choice" != "1" ] && [ "$choice" != "2" ]; then
    echo "Invalid Choice"
    exit 1 #what is the difference between exit 0 and exit 1 
fi     

read -p "Enter Project name: " project_name

if [ -z "$project_name" ]; then 
    echo "Project name is empy" 
    exit 
fi   


if [ -d "$project_name" ]; then 
    echo "Project already exists" 
    exit 
fi   


#ALRIGHT SO TIME FOR ACTUAL REACT CREATION STUFF 
echo ""
if [ "$choice" == 1 ]; then
    npm create vite@latest "$project_name" -- --template react-ts
    config_file = "vite.config.js" 
else 
    npm create vite@latest "$project_name" -- --template react
    config_file = "vite.config.js" 
fi 

cd "$project_name" 
npm install 


echo "" 
echo "installing tailwind" 
npm install -D tailwindcss @tailwindcss/vite

echo "" 
echo "Configuring Tailwind in Vite config..." 
if [ -f "$config_file" ]; then
    cat > "$config_file" << EOF
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
echo "Adding Tailwind import to CSS file..." 

mkdir -p src
cat > src/style.css <<EOF
@import "tailwindcss" 
EOF
echo ""
echo "Tailwind setup complete" 


 


