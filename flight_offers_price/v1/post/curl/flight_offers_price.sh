# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

curl -X POST -H "Authorization: Bearer $ACCESS_TOKEN" \
-H "Content-Type: application/json" \
https://test.api.amadeus.com/v1/shopping/flight-offers/pricing \
-d '{
    "data": {
        "type": "flight-offers-pricing",
        "flightOffers": [
        {
            "type": "flight-offer",
            "id": "1",
            "source": "GDS",
            "instantTicketingRequired": false,
            "nonHomogeneous": false,
            "oneWay": false,
            "lastTicketingDate": "2020-03-01",
            "numberOfBookableSeats": 4,
            "itineraries": [
            {
                "duration": "PT14H10M",
                "segments": [
                {
                    "departure": {
                    "iataCode": "GIG",
                    "at": "2020-03-01T23:30:00"
                    },
                    "arrival": {
                    "iataCode": "CMN",
                    "terminal": "2",
                    "at": "2020-03-02T12:10:00"
                    },
                    "carrierCode": "AT",
                    "number": "212",
                    "aircraft": {
                    "code": "788"
                    },
                    "operating": {
                    "carrierCode": "AT"
                    },
                    "id": "3",
                    "numberOfStops": 0,
                    "blacklistedInEU": false
                },
                {
                    "departure": {
                    "iataCode": "CMN",
                    "terminal": "2",
                    "at": "2020-03-02T15:45:00"
                    },
                    "arrival": {
                    "iataCode": "MAD",
                    "terminal": "4S",
                    "at": "2020-03-02T17:40:00"
                    },
                    "carrierCode": "AT",
                    "number": "970",
                    "aircraft": {
                    "code": "73G"
                    },
                    "operating": {
                    "carrierCode": "AT"
                    },
                    "id": "4",
                    "numberOfStops": 0,
                    "blacklistedInEU": false
                }
                ]
            },
            {
                "duration": "PT31H20M",
                "segments": [
                {
                    "departure": {
                    "iataCode": "MAD",
                    "terminal": "4S",
                    "at": "2020-03-05T18:40:00"
                    },
                    "arrival": {
                    "iataCode": "CMN",
                    "terminal": "2",
                    "at": "2020-03-05T20:30:00"
                    },
                    "carrierCode": "AT",
                    "number": "971",
                    "aircraft": {
                    "code": "738"
                    },
                    "operating": {
                    "carrierCode": "AT"
                    },
                    "id": "47",
                    "numberOfStops": 0,
                    "blacklistedInEU": false
                },
                {
                    "departure": {
                    "iataCode": "CMN",
                    "terminal": "2",
                    "at": "2020-03-06T16:40:00"
                    },
                    "arrival": {
                    "iataCode": "GIG",
                    "at": "2020-03-06T22:00:00"
                    },
                    "carrierCode": "AT",
                    "number": "213",
                    "aircraft": {
                    "code": "788"
                    },
                    "operating": {
                    "carrierCode": "AT"
                    },
                    "id": "48",
                    "numberOfStops": 0,
                    "blacklistedInEU": false
                }
                ]
            }
            ],
            "price": {
            "currency": "USD",
            "total": "2778.98",
            "base": "2568.00",
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
            "AT"
            ],
            "travelerPricings": [
            {
                "travelerId": "1",
                "fareOption": "STANDARD",
                "travelerType": "ADULT",
                "price": {
                "currency": "USD",
                "total": "1625.49",
                "base": "1520.00"
                },
                "fareDetailsBySegment": [
                {
                    "segmentId": "3",
                    "cabin": "BUSINESS",
                    "fareBasis": "DA0R0BRA",
                    "class": "D",
                    "includedCheckedBags": {
                    "quantity": 3
                    }
                },
                {
                    "segmentId": "4",
                    "cabin": "BUSINESS",
                    "fareBasis": "DA0R0BRA",
                    "class": "D",
                    "includedCheckedBags": {
                    "quantity": 3
                    }
                },
                {
                    "segmentId": "47",
                    "cabin": "ECONOMY",
                    "fareBasis": "XL0R0BRA",
                    "class": "X",
                    "includedCheckedBags": {
                    "quantity": 2
                    }
                },
                {
                    "segmentId": "48",
                    "cabin": "ECONOMY",
                    "fareBasis": "XL0R0BRA",
                    "class": "X",
                    "includedCheckedBags": {
                    "quantity": 2
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
                "total": "1153.49",
                "base": "1048.00"
                },
                "fareDetailsBySegment": [
                {
                    "segmentId": "3",
                    "cabin": "BUSINESS",
                    "fareBasis": "DA0R0BRACH",
                    "class": "D"
                },
                {
                    "segmentId": "4",
                    "cabin": "BUSINESS",
                    "fareBasis": "DA0R0BRACH",
                    "class": "D"
                },
                {
                    "segmentId": "47",
                    "cabin": "ECONOMY",
                    "fareBasis": "XL0R0BRACH",
                    "class": "X"
                },
                {
                    "segmentId": "48",
                    "cabin": "ECONOMY",
                    "fareBasis": "XL0R0BRACH",
                    "class": "X"
                }
                ]
            }
            ]
        }
        ]
    }
}'