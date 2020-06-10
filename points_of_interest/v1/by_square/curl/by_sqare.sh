# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

# What are the popular places in Barcelona (based on a square)
curl -X GET "https://test.api.amadeus.com/v1/reference-data/locations/pois/by-square?north=41.397158&west=2.160873&south=41.394582&east=2.177181" -H "Authorization: Bearer $ACCESS_TOKEN" -k