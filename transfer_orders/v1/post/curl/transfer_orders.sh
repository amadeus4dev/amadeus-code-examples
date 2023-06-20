# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

curl -X POST -H "Authorization: Bearer $ACCESS_TOKEN" \
-H "Content-Type: application/json" \
https://test.api.amadeus.com/v1/shopping/transfer-offers?offerId=5976726751 \
-d '{
  "data": {
    "note": "Note to driver",
    "passengers": [
      {
        "firstName": "John",
        "lastName": "Doe",
        "title": "MR",
        "contacts": {
          "phoneNumber": "+33123456789",
          "email": "user@email.com"
        },
        "billingAddress": {
          "line": "Avenue de la Bourdonnais, 19",
          "zip": "75007",
          "countryCode": "FR",
          "cityName": "Paris"
        }
      }
    ],
    "agency": {
      "contacts": [
        {
          "email": {
            "address": "abc@test.com"
          }
        }
      ]
    },
    "payment": {
      "methodOfPayment": "CREDIT_CARD",
      "creditCard": {
        "number": "4111111111111111",
        "holderName": "JOHN DOE",
        "vendorCode": "VI",
        "expiryDate": "0928",
        "cvv": "111"
      }
    },
    "extraServices": [
      {
        "code": "EWT",
        "itemId": "EWT0291"
      }
    ],
    "equipment": [
      {
        "code": "BBS"
      }
    ],
    "corporation": {
      "address": {
        "line": "5 Avenue Anatole France",
        "zip": "75007",
        "countryCode": "FR",
        "cityName": "Paris"
      },
      "info": {
        "AU": "FHOWMD024",
        "CE": "280421GH"
      }
    },
    "startConnectedSegment": {
      "transportationType": "FLIGHT",
      "transportationNumber": "AF380",
      "departure": {
        "uicCode": "7400001",
        "iataCode": "CDG",
        "localDateTime": "2023-03-27T20:03:00"
      },
      "arrival": {
        "uicCode": "7400001",
        "iataCode": "CDG",
        "localDateTime": "2023-03-27T20:03:00"
      }
    },
    "endConnectedSegment": {
      "transportationType": "FLIGHT",
      "transportationNumber": "AF380",
      "departure": {
        "uicCode": "7400001",
        "iataCode": "CDG",
        "localDateTime": "2023-03-27T20:03:00"
      },
      "arrival": {
        "uicCode": "7400001",
        "iataCode": "CDG",
        "localDateTime": "2023-03-27T20:03:00"
      }
    }
  }
}'