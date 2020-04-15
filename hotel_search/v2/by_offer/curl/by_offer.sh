# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

# For a dedicated hotel and a dedicated offer check if the price is still the same and if the offer is still available
curl -X GET "https://test.api.amadeus.com/v2/shopping/hotel-offers/63A93695B58821ABB0EC2B33FE9FAB24D72BF34B1BD7D707293763D8D9378FC3​​​​​​​" -H "Authorization: Bearer $ACCESS_TOKEN" -k