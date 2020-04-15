# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

curl -X POST -H "Authorization: Bearer $ACCESS_TOKEN" \
-H "Content-Type: application/json" \
https://test.api.amadeus.com/v2/shopping/flight-offers \
-d '{
  "currencyCode": "USD",
  "originDestinations": [
    {
      "id": "1",
      "originLocationCode": "RIO",
      "destinationLocationCode": "MAD",
      "departureDateTimeRange": {
        "date": "2020-08-01",
        "time": "10:00:00"
      }
    },
    {
      "id": "2",
      "originLocationCode": "MAD",
      "destinationLocationCode": "RIO",
      "departureDateTimeRange": {
        "date": "2020-08-05",
        "time": "17:00:00"
      }
    }
  ],
  "travelers": [
    {
      "id": "1",
      "travelerType": "ADULT"
    },
    {
      "id": "2",
      "travelerType": "CHILD"
    }
  ],
  "sources": [
    "GDS"
  ],
  "searchCriteria": {
    "maxFlightOffers": 2,
    "flightFilters": {
      "cabinRestrictions": [
        {
          "cabin": "BUSINESS",
          "coverage": "MOST_SEGMENTS",
          "originDestinationIds": [
            "1"
          ]
        }
      ],
      "carrierRestrictions": {
        "excludedCarrierCodes": [
          "AA",
          "TP",
          "AZ"
        ]
      }
    }
  }
}'