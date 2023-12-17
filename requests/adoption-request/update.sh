id=$1
body="\"$2\": \"$3\""
if [ "$#" = 5 ]; then
   body="$body, \"$4\": \"$5\""
fi
curl -s -X PUT "http://localhost:8000/adoptionrequests/update/$id" \
    -H "Content-Type: application/json" \
    -d "{$body}"
echo