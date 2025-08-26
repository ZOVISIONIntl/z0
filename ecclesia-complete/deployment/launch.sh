#!/bin/bash
echo "🎯 Launching Ecclesia of Existence - Complete Operational Platform"
echo ""

# Navigate to backend directory
cd ../backend

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js not found. Please install Node.js first."
    echo "Visit: https://nodejs.org/"
    exit 1
fi

echo "✅ Node.js found"
echo "🚀 Starting Ecclesia of Existence server..."
echo ""

# Start the server
node server.js
