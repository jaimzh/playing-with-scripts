#!/bin/bash

# This script sets up a React project with the following features:
# - Creates a new React project using Create React App
# - Installs additional dependencies (e.g., axios, react-router-dom)
# - Sets up a basic project structure
# - Creates a README with setup instructions
# - Initializes a Git repository
# - Installs dependencies
# - Starts the development server

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Please install Node.js to use this script."
    exit 1
fi

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "npm is not installed. Please install npm to use this script."
    exit 1
fi

# Create a new React project
npx create-react-app my-react-app

cd my-react-app

# Install additional dependencies
npm install axios react-router-dom

# Create a README with setup instructions
echo "# React Project Setup" > README.md
echo "" >> README.md
echo "## Setup Instructions" >> README.md
echo "" >> README.md
echo "1. Install dependencies: npm install" >> README.md
echo "2. Start the development server: npm start" >> README.md
echo "" >> README.md
echo "## Project Structure" >> README.md
echo "" >> README.md
echo "src/" >> README.md
echo "├── components/" >> README.md
echo "│   ├── App.js" >> README.md
echo "│   └── index.js" >> README.md
echo "├── pages/" >> README.md
echo "│   ├── Home.js" >> README.md
echo "│   └── About.js" >> README.md
echo "├── services/" >> README.md
echo "│   └── api.js" >> README.md
echo "├── utils/" >> README.md
echo "│   └── helpers.js" >> README.md
echo "└── index.css" >> README.md
echo "" >> README.md
echo "## Technologies Used" >> README.md
echo "" >> README.md
echo "- React" >> README.md
echo "- Axios" >> README.md
echo "- React Router DOM" >> README.md
echo "" >> README.md
echo "## License" >> README.md
echo "" >> README.md
echo "MIT License" >> README.md
echo "" >> README.md
echo "Copyright (c) 2023 Your Name" >> README.md
echo "" >> README.md
echo "Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the \"Software\"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:"
echo "" >> README.md
echo "The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software."
echo "" >> README.md
echo "THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE." >> README.md

# Initialize a Git repository
git init

git add .
git commit -m "Initial commit"

echo "React project setup complete!"
echo "Starting development server..."

# Start the development server
npm start