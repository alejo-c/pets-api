curl -s -X POST http://localhost:8000/pets/create \
    -H "Content-Type: application/json" \
    -d "{\"type\": \"$1\", \"name\":\"$2\", \"age\":\"$3\"}"  
echo