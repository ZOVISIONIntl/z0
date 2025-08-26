#!/bin/bash
echo "🎯 Deploying z0 Constitutional AI OS"

# Initialize Guardian
cd core/guardian && python main.py &

# Initialize Foundry  
cd ../foundry && python main.py &

# Deploy Cleveland pilot agent
python -c "
from foundry.main import foundry
agent_id = foundry.spawn_cleveland_agent()
print(f'Cleveland pilot agent deployed: {agent_id}')
"

echo "✅ z0 Constitutional AI OS operational"
echo "🚀 Cleveland pilot agent ready for deployment"
