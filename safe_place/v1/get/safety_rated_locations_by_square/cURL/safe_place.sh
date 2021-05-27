# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

# How safe is Barcelona? (based on a square)
curl -X GET "https://test.api.amadeus.com/v1/safety/safety-rated-locations/by-square?north=43.645218&west=7.182018&south=43.760768&east=7.323896" -H "Authorization: Bearer $ACCESS_TOKEN" -k