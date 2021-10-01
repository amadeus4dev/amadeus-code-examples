# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

curl -X POST -H "Authorization: Bearer $ACCESS_TOKEN" \
-H "Content-Type: application/json" \
https://test.api.amadeus.com/v1/shopping/seatmaps \
-d '{
    "data": [
        {
            "type": "flight-offer",
            "id": "1",
            "source": "GDS",
            "instantTicketingRequired": false,
            "nonHomogeneous": false,
            "oneWay": false,
            "lastTicketingDate": "2022-03-07",
            "numberOfBookableSeats": 9,
            "itineraries": [
                {
                    "duration": "PT15H15M",
                    "segments": [
                        {
                            "departure": {
                                "iataCode": "NCE",
                                "terminal": "1",
                                "at": "2022-09-26T06:00:00"
                            },
                            "arrival": {
                                "iataCode": "LIS",
                                "terminal": "1",
                                "at": "2022-09-26T07:35:00"
                            },
                            "carrierCode": "TP",
                            "number": "481",
                            "aircraft": {
                                "code": "E90"
                            },
                            "operating": {
                                "carrierCode": "NI"
                            },
                            "duration": "PT2H35M",
                            "id": "33",
                            "numberOfStops": 0,
                            "blacklistedInEU": false
                        },
                        {
                            "departure": {
                                "iataCode": "LIS",
                                "terminal": "1",
                                "at": "2022-09-26T12:15:00"
                            },
                            "arrival": {
                                "iataCode": "EWR",
                                "terminal": "B",
                                "at": "2022-09-26T15:15:00"
                            },
                            "carrierCode": "TP",
                            "number": "201",
                            "aircraft": {
                                "code": "339"
                            },
                            "operating": {
                                "carrierCode": "TP"
                            },
                            "duration": "PT8H",
                            "id": "34",
                            "numberOfStops": 0,
                            "blacklistedInEU": false
                        }
                    ]
                }
            ],
            "price": {
                "currency": "EUR",
                "total": "238.23",
                "base": "52.00",
                "fees": [
                    {
                        "amount": "0.00",
                        "type": "SUPPLIER"
                    },
                    {
                        "amount": "0.00",
                        "type": "TICKETING"
                    }
                ],
                "grandTotal": "238.23",
                "additionalServices": [
                    {
                        "amount": "75.00",
                        "type": "CHECKED_BAGS"
                    }
                ]
            },
            "pricingOptions": {
                "fareType": [
                    "PUBLISHED"
                ],
                "includedCheckedBagsOnly": false
            },
            "validatingAirlineCodes": [
                "TP"
            ],
            "travelerPricings": [
                {
                    "travelerId": "1",
                    "fareOption": "STANDARD",
                    "travelerType": "ADULT",
                    "price": {
                        "currency": "EUR",
                        "total": "238.23",
                        "base": "52.00"
                    },
                    "fareDetailsBySegment": [
                        {
                            "segmentId": "33",
                            "cabin": "ECONOMY",
                            "fareBasis": "EFRDSI0D",
                            "brandedFare": "DISCOUNT",
                            "class": "E",
                            "includedCheckedBags": {
                                "quantity": 0
                            }
                        },
                        {
                            "segmentId": "34",
                            "cabin": "ECONOMY",
                            "fareBasis": "EFRDSI0D",
                            "brandedFare": "DISCOUNT",
                            "class": "E",
                            "includedCheckedBags": {
                                "quantity": 0
                            }
                        }
                    ]
                }
            ]
        }
    ]
}'