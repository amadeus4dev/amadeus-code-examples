# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

curl -X POST -H "Authorization: Bearer $ACCESS_TOKEN" \
-H "Content-Type: application/json" \
https://test.api.amadeus.com/v1/shopping/availability/flight-availabilities \
-d '{
    "originDestinations": [
        {
            "id": "1",
            "originLocationCode": "MIA",
            "destinationLocationCode": "ATL",
            "departureDateTime": {
                "date": "2022-11-01"
            }
        }
    ],
    "travelers": [
        {
            "id": "1",
            "travelerType": "ADULT"
        }
    ],
    "sources": [
        "GDS"
    ]
}'