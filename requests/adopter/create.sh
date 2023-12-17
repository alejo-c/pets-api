curl -s -X POST http://localhost:8000/adopters/create \
    -H "Content-Type: application/json" \
    -d "{\"name\":\"$1\", \"address\":\"$2\", \"contact\":\"$3\"}"  
echo