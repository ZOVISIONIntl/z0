import hashlib
import json
import time
from typing import Dict, Any
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.asymmetric import rsa
from cryptography.hazmat.primitives import serialization

class ConstitutionalActionLog:
    """Hash-chained, signed audit trail for all z0 actions"""
    
    def __init__(self):
        self.chain = []
        self.private_key = rsa.generate_private_key(
            public_exponent=65537,
            key_size=2048
        )
    
    def log_action(self, agent: str, action: str, data: Dict[Any, Any], 
                   constitutional_check: bool) -> str:
        """Log action with constitutional compliance verification"""
        
        timestamp = int(time.time())
        prev_hash = self.chain[-1]['hash'] if self.chain else "genesis"
        
        entry = {
            "timestamp": timestamp,
            "agent": agent,
            "action": action,
            "data": data,
            "constitutional_compliance": constitutional_check,
            "prev_hash": prev_hash
        }
        
        # Create hash
        entry_str = json.dumps(entry, sort_keys=True)
        entry_hash = hashlib.sha256(entry_str.encode()).hexdigest()
        entry["hash"] = entry_hash
        
        # Sign entry
        signature = self.private_key.sign(
            entry_str.encode(),
            padding.PSS(
                mgf=padding.MGF1(hashes.SHA256()),
                salt_length=padding.PSS.MAX_LENGTH
            ),
            hashes.SHA256()
        )
        entry["signature"] = signature.hex()
        
        self.chain.append(entry)
        return entry_hash
