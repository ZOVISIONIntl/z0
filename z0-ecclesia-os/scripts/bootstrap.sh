#!/bin/bash
echo "🎯 Bootstrapping z0 Constitutional AI OS"
echo "Ecclesia of Existence - Digital Sovereignty Activation"

# Initialize infrastructure
docker-compose up -d postgres minio vault

# Wait for services
sleep 30

# Initialize Guardian with constitution
docker-compose up -d guardian

# Deploy foundry for mission agents
docker-compose up -d foundry

# Activate scout for intelligence gathering
docker-compose up -d scout librarian

echo "✅ z0 Constitutional AI OS operational"
echo "Guardian enforcing Law of Existence"
echo "Foundry ready for mission deployment"
echo "Scout gathering intelligence for Cleveland pilot"

# Spawn Cleveland pilot agent
curl -X POST http://localhost:8080/foundry/spawn \
  -H "Content-Type: application/json" \
  -d '{
    "mission": "cleveland_pilot",
    "config": {
      "budget_cap": 25000,
      "time_limit": 2592000,
      "tools": ["web_research", "bank_outreach", "portfolio_analysis"]
    }
  }'

echo "🚀 Cleveland Pilot Agent deployed with constitutional compliance"
