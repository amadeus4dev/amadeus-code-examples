# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

curl -X POST -H "Authorization: Bearer $ACCESS_TOKEN" \
-H "Content-Type: application/json" \
https://test.api.amadeus.com/v1/shopping/transfer-offers \
-d '{
  "startLocationCode": "CDG",
  "endAddressLine": "Avenue Anatole France, 5",
  "endCityName": "Paris",
  "endZipCode": "75007",
  "endCountryCode": "FR",
  "endName": "Souvenirs De La Tour",
  "endGeoCode": "48.859466,2.2976965",
  "transferType": "PRIVATE",
  "startDateTime": "2023-11-10T10:30:00",
  "providerCodes": "TXO",
  "passengers": 2,
  "stopOvers": [
    {
      "duration": "PT2H30M",
      "sequenceNumber": 1,
      "addressLine": "Avenue de la Bourdonnais, 19",
      "countryCode": "FR",
      "cityName": "Paris",
      "zipCode": "75007",
      "name": "De La Tours",
      "geoCode": "48.859477,2.2976985",
      "stateCode": "FR"
    }
  ],
  "startConnectedSegment": {
    "transportationType": "FLIGHT",
    "transportationNumber": "AF380",
    "departure": {
      "localDateTime": "2023-11-10T09:00:00",
      "iataCode": "NCE"
    },
    "arrival": {
      "localDateTime": "2023-11-10T10:00:00",
      "iataCode": "CDG"
    }
  },
  "passengerCharacteristics": [
    {
      "passengerTypeCode": "ADT",
      "age": 20
    },
    {
      "passengerTypeCode": "CHD",
      "age": 10
    }
  ]
}'