curl -s -X POST http://localhost:8000/adoptionrequests/create \
    -H "Content-Type: application/json" \
    -d "{\"pet_id\": \"$1\", \"adopter_id\":\"$2\"}"  
echo