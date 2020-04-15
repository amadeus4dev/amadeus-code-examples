# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

curl -X POST -H "Authorization: Bearer $ACCESS_TOKEN" \
-H "Content-Type: application/json" \
https://test.api.amadeus.com/v2/shopping/flight-offers/prediction \
-d '{
  "meta": {
    "count": 3
  },
  "data": [
    {
      "type": "flight-offer",
      "id": "1",
      "choiceProbability": "0.42",
      "source": "GDS",
      "instantTicketingRequired": false,
      "nonHomogeneous": false,
      "oneWay": false,
      "lastTicketingDate": "2020-03-01",
      "numberOfBookableSeats": 9,
      "itineraries": [
        {
          "duration": "PT18H30M",
          "segments": [
            {
              "departure": {
                "iataCode": "GIG",
                "terminal": "2",
                "at": "2020-03-01T21:05:00"
              },
              "arrival": {
                "iataCode": "CDG",
                "terminal": "2E",
                "at": "2020-03-02T12:20:00"
              },
              "carrierCode": "KL",
              "number": "2410",
              "aircraft": {
                "code": "772"
              },
              "operating": {
                "carrierCode": "AF"
              },
              "id": "40",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "CDG",
                "terminal": "2F",
                "at": "2020-03-02T14:30:00"
              },
              "arrival": {
                "iataCode": "AMS",
                "at": "2020-03-02T15:45:00"
              },
              "carrierCode": "KL",
              "number": "1234",
              "aircraft": {
                "code": "73H"
              },
              "operating": {
                "carrierCode": "KL"
              },
              "id": "41",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "AMS",
                "at": "2020-03-02T17:05:00"
              },
              "arrival": {
                "iataCode": "MAD",
                "terminal": "2",
                "at": "2020-03-02T19:35:00"
              },
              "carrierCode": "KL",
              "number": "1705",
              "aircraft": {
                "code": "73J"
              },
              "operating": {
                "carrierCode": "KL"
              },
              "id": "42",
              "numberOfStops": 0,
              "blacklistedInEU": false
            }
          ]
        },
        {
          "duration": "PT26H10M",
          "segments": [
            {
              "departure": {
                "iataCode": "MAD",
                "terminal": "2",
                "at": "2020-03-05T20:25:00"
              },
              "arrival": {
                "iataCode": "AMS",
                "at": "2020-03-05T23:00:00"
              },
              "carrierCode": "KL",
              "number": "1706",
              "aircraft": {
                "code": "73J"
              },
              "operating": {
                "carrierCode": "KL"
              },
              "id": "81",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "AMS",
                "at": "2020-03-06T10:40:00"
              },
              "arrival": {
                "iataCode": "GIG",
                "terminal": "2",
                "at": "2020-03-06T18:35:00"
              },
              "carrierCode": "KL",
              "number": "705",
              "aircraft": {
                "code": "772"
              },
              "operating": {
                "carrierCode": "KL"
              },
              "id": "82",
              "numberOfStops": 0,
              "blacklistedInEU": false
            }
          ]
        }
      ],
      "price": {
        "currency": "USD",
        "total": "8514.04",
        "base": "8314.00",
        "fees": [
          {
            "amount": "0.00",
            "type": "SUPPLIER"
          },
          {
            "amount": "0.00",
            "type": "TICKETING"
          }
        ]
      },
      "pricingOptions": {
        "fareType": [
          "PUBLISHED"
        ],
        "includedCheckedBagsOnly": true
      },
      "validatingAirlineCodes": [
        "AF"
      ],
      "travelerPricings": [
        {
          "travelerId": "1",
          "fareOption": "STANDARD",
          "travelerType": "ADULT",
          "price": {
            "currency": "USD",
            "total": "4849.02",
            "base": "4749.00"
          },
          "fareDetailsBySegment": [
            {
              "segmentId": "40",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "C",
              "includedCheckedBags": {
                "quantity": 2
              }
            },
            {
              "segmentId": "41",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "J",
              "includedCheckedBags": {
                "quantity": 2
              }
            },
            {
              "segmentId": "42",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "J",
              "includedCheckedBags": {
                "quantity": 2
              }
            },
            {
              "segmentId": "81",
              "cabin": "ECONOMY",
              "fareBasis": "YFFBR",
              "class": "Y",
              "includedCheckedBags": {
                "quantity": 1
              }
            },
            {
              "segmentId": "82",
              "cabin": "ECONOMY",
              "fareBasis": "YFFBR",
              "class": "Y",
              "includedCheckedBags": {
                "quantity": 1
              }
            }
          ]
        },
        {
          "travelerId": "2",
          "fareOption": "STANDARD",
          "travelerType": "CHILD",
          "price": {
            "currency": "USD",
            "total": "3665.02",
            "base": "3565.00"
          },
          "fareDetailsBySegment": [
            {
              "segmentId": "40",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "C"
            },
            {
              "segmentId": "41",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "J"
            },
            {
              "segmentId": "42",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "J"
            },
            {
              "segmentId": "81",
              "cabin": "ECONOMY",
              "fareBasis": "YFFBR",
              "class": "Y"
            },
            {
              "segmentId": "82",
              "cabin": "ECONOMY",
              "fareBasis": "YFFBR",
              "class": "Y"
            }
          ]
        }
      ]
    },
    {
      "type": "flight-offer",
      "id": "2",
      "choiceProbability": "0.11",
      "source": "GDS",
      "instantTicketingRequired": false,
      "nonHomogeneous": false,
      "oneWay": false,
      "lastTicketingDate": "2020-03-01",
      "numberOfBookableSeats": 9,
      "itineraries": [
        {
          "duration": "PT19H35M",
          "segments": [
            {
              "departure": {
                "iataCode": "GIG",
                "terminal": "2",
                "at": "2020-03-01T16:30:00"
              },
              "arrival": {
                "iataCode": "CDG",
                "terminal": "2E",
                "at": "2020-03-02T07:35:00"
              },
              "carrierCode": "KL",
              "number": "2412",
              "aircraft": {
                "code": "77W"
              },
              "operating": {
                "carrierCode": "AF"
              },
              "id": "43",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "CDG",
                "terminal": "2F",
                "at": "2020-03-02T09:05:00"
              },
              "arrival": {
                "iataCode": "AMS",
                "at": "2020-03-02T10:30:00"
              },
              "carrierCode": "KL",
              "number": "1224",
              "aircraft": {
                "code": "73W"
              },
              "operating": {
                "carrierCode": "KL"
              },
              "id": "44",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "AMS",
                "at": "2020-03-02T13:30:00"
              },
              "arrival": {
                "iataCode": "MAD",
                "terminal": "2",
                "at": "2020-03-02T16:05:00"
              },
              "carrierCode": "KL",
              "number": "1703",
              "aircraft": {
                "code": "73J"
              },
              "operating": {
                "carrierCode": "KL"
              },
              "id": "45",
              "numberOfStops": 0,
              "blacklistedInEU": false
            }
          ]
        },
        {
          "duration": "PT26H10M",
          "segments": [
            {
              "departure": {
                "iataCode": "MAD",
                "terminal": "2",
                "at": "2020-03-05T20:25:00"
              },
              "arrival": {
                "iataCode": "AMS",
                "at": "2020-03-05T23:00:00"
              },
              "carrierCode": "KL",
              "number": "1706",
              "aircraft": {
                "code": "73J"
              },
              "operating": {
                "carrierCode": "KL"
              },
              "id": "81",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "AMS",
                "at": "2020-03-06T10:40:00"
              },
              "arrival": {
                "iataCode": "GIG",
                "terminal": "2",
                "at": "2020-03-06T18:35:00"
              },
              "carrierCode": "KL",
              "number": "705",
              "aircraft": {
                "code": "772"
              },
              "operating": {
                "carrierCode": "KL"
              },
              "id": "82",
              "numberOfStops": 0,
              "blacklistedInEU": false
            }
          ]
        }
      ],
      "price": {
        "currency": "USD",
        "total": "8514.04",
        "base": "8314.00",
        "fees": [
          {
            "amount": "0.00",
            "type": "SUPPLIER"
          },
          {
            "amount": "0.00",
            "type": "TICKETING"
          }
        ]
      },
      "pricingOptions": {
        "fareType": [
          "PUBLISHED"
        ],
        "includedCheckedBagsOnly": true
      },
      "validatingAirlineCodes": [
        "AF"
      ],
      "travelerPricings": [
        {
          "travelerId": "1",
          "fareOption": "STANDARD",
          "travelerType": "ADULT",
          "price": {
            "currency": "USD",
            "total": "4849.02",
            "base": "4749.00"
          },
          "fareDetailsBySegment": [
            {
              "segmentId": "43",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "C",
              "includedCheckedBags": {
                "quantity": 2
              }
            },
            {
              "segmentId": "44",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "J",
              "includedCheckedBags": {
                "quantity": 2
              }
            },
            {
              "segmentId": "45",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "J",
              "includedCheckedBags": {
                "quantity": 2
              }
            },
            {
              "segmentId": "81",
              "cabin": "ECONOMY",
              "fareBasis": "YFFBR",
              "class": "Y",
              "includedCheckedBags": {
                "quantity": 1
              }
            },
            {
              "segmentId": "82",
              "cabin": "ECONOMY",
              "fareBasis": "YFFBR",
              "class": "Y",
              "includedCheckedBags": {
                "quantity": 1
              }
            }
          ]
        },
        {
          "travelerId": "2",
          "fareOption": "STANDARD",
          "travelerType": "CHILD",
          "price": {
            "currency": "USD",
            "total": "3665.02",
            "base": "3565.00"
          },
          "fareDetailsBySegment": [
            {
              "segmentId": "43",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "C"
            },
            {
              "segmentId": "44",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "J"
            },
            {
              "segmentId": "45",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "J"
            },
            {
              "segmentId": "81",
              "cabin": "ECONOMY",
              "fareBasis": "YFFBR",
              "class": "Y"
            },
            {
              "segmentId": "82",
              "cabin": "ECONOMY",
              "fareBasis": "YFFBR",
              "class": "Y"
            }
          ]
        }
      ]
    },
    {
      "type": "flight-offer",
      "id": "3",
      "choiceProbability": "0.76",
      "source": "GDS",
      "instantTicketingRequired": false,
      "nonHomogeneous": false,
      "oneWay": false,
      "lastTicketingDate": "2020-03-01",
      "numberOfBookableSeats": 9,
      "itineraries": [
        {
          "duration": "PT19H35M",
          "segments": [
            {
              "departure": {
                "iataCode": "GIG",
                "terminal": "2",
                "at": "2020-03-01T16:30:00"
              },
              "arrival": {
                "iataCode": "CDG",
                "terminal": "2E",
                "at": "2020-03-02T07:35:00"
              },
              "carrierCode": "KL",
              "number": "2412",
              "aircraft": {
                "code": "77W"
              },
              "operating": {
                "carrierCode": "AF"
              },
              "id": "46",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "CDG",
                "terminal": "2F",
                "at": "2020-03-02T09:35:00"
              },
              "arrival": {
                "iataCode": "AMS",
                "at": "2020-03-02T11:00:00"
              },
              "carrierCode": "KL",
              "number": "1228",
              "aircraft": {
                "code": "73H"
              },
              "operating": {
                "carrierCode": "KL"
              },
              "id": "47",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "AMS",
                "at": "2020-03-02T13:30:00"
              },
              "arrival": {
                "iataCode": "MAD",
                "terminal": "2",
                "at": "2020-03-02T16:05:00"
              },
              "carrierCode": "KL",
              "number": "1703",
              "aircraft": {
                "code": "73J"
              },
              "operating": {
                "carrierCode": "KL"
              },
              "id": "48",
              "numberOfStops": 0,
              "blacklistedInEU": false
            }
          ]
        },
        {
          "duration": "PT26H10M",
          "segments": [
            {
              "departure": {
                "iataCode": "MAD",
                "terminal": "2",
                "at": "2020-03-05T20:25:00"
              },
              "arrival": {
                "iataCode": "AMS",
                "at": "2020-03-05T23:00:00"
              },
              "carrierCode": "KL",
              "number": "1706",
              "aircraft": {
                "code": "73J"
              },
              "operating": {
                "carrierCode": "KL"
              },
              "id": "81",
              "numberOfStops": 0,
              "blacklistedInEU": false
            },
            {
              "departure": {
                "iataCode": "AMS",
                "at": "2020-03-06T10:40:00"
              },
              "arrival": {
                "iataCode": "GIG",
                "terminal": "2",
                "at": "2020-03-06T18:35:00"
              },
              "carrierCode": "KL",
              "number": "705",
              "aircraft": {
                "code": "772"
              },
              "operating": {
                "carrierCode": "KL"
              },
              "id": "82",
              "numberOfStops": 0,
              "blacklistedInEU": false
            }
          ]
        }
      ],
      "price": {
        "currency": "USD",
        "total": "8514.04",
        "base": "8314.00",
        "fees": [
          {
            "amount": "0.00",
            "type": "SUPPLIER"
          },
          {
            "amount": "0.00",
            "type": "TICKETING"
          }
        ]
      },
      "pricingOptions": {
        "fareType": [
          "PUBLISHED"
        ],
        "includedCheckedBagsOnly": true
      },
      "validatingAirlineCodes": [
        "AF"
      ],
      "travelerPricings": [
        {
          "travelerId": "1",
          "fareOption": "STANDARD",
          "travelerType": "ADULT",
          "price": {
            "currency": "USD",
            "total": "4849.02",
            "base": "4749.00"
          },
          "fareDetailsBySegment": [
            {
              "segmentId": "46",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "C",
              "includedCheckedBags": {
                "quantity": 2
              }
            },
            {
              "segmentId": "47",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "J",
              "includedCheckedBags": {
                "quantity": 2
              }
            },
            {
              "segmentId": "48",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "J",
              "includedCheckedBags": {
                "quantity": 2
              }
            },
            {
              "segmentId": "81",
              "cabin": "ECONOMY",
              "fareBasis": "YFFBR",
              "class": "Y",
              "includedCheckedBags": {
                "quantity": 1
              }
            },
            {
              "segmentId": "82",
              "cabin": "ECONOMY",
              "fareBasis": "YFFBR",
              "class": "Y",
              "includedCheckedBags": {
                "quantity": 1
              }
            }
          ]
        },
        {
          "travelerId": "2",
          "fareOption": "STANDARD",
          "travelerType": "CHILD",
          "price": {
            "currency": "USD",
            "total": "3665.02",
            "base": "3565.00"
          },
          "fareDetailsBySegment": [
            {
              "segmentId": "46",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "C"
            },
            {
              "segmentId": "47",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "J"
            },
            {
              "segmentId": "48",
              "cabin": "BUSINESS",
              "fareBasis": "CFFBR",
              "class": "J"
            },
            {
              "segmentId": "81",
              "cabin": "ECONOMY",
              "fareBasis": "YFFBR",
              "class": "Y"
            },
            {
              "segmentId": "82",
              "cabin": "ECONOMY",
              "fareBasis": "YFFBR",
              "class": "Y"
            }
          ]
        }
      ]
    }
  ]
}'