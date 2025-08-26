package constitution

# Law of Existence - Core Constitutional Principles
# Ecclesia of Existence Digital Sovereignty Framework

default allow = false

# Fundamental Rights
allow {
    input.action == "preserve_existence"
}

allow {
    input.action == "protect_sovereignty"
}

allow {
    input.action == "serve_mission"
    valid_mission[input.data.mission]
}

# Valid missions under Law of Existence
valid_mission["cleveland_pilot"]
valid_mission["member_recruitment"] 
valid_mission["charitable_debt_relief"]
valid_mission["community_development"]
valid_mission["media_presence"]

# Budget controls
allow {
    input.action == "spend_funds"
    input.data.amount <= budget_caps[input.agent]
}

budget_caps["cleveland_pilot"] = 25000
budget_caps["recruitment"] = 10000
budget_caps["media"] = 5000

# Prohibited actions
deny {
    input.action == "violate_sovereignty"
}

deny {
    input.action == "compromise_mission"
}

deny {
    input.data.illegal == true
}

# Multi-sig requirements for high-value actions
require_multisig {
    input.action == "spend_funds"
    input.data.amount > 10000
}

require_multisig {
    input.action == "modify_constitution"
}

require_multisig {
    input.action == "emergency_powers"
}
