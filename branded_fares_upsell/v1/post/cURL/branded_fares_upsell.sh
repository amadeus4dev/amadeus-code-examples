# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

curl -X POST -H "Authorization: Bearer $ACCESS_TOKEN" \
-H "Content-Type: application/json" \
https://test.api.amadeus.com/v1/shopping/flight-offers/upselling \
-d '{
    "data": {
        "type": "flight-offers-upselling",
        "flightOffers": [
            {
                "type": "flight-offer",
                "id": "1",
                "source": "GDS",
                "instantTicketingRequired": false,
                "nonHomogeneous": false,
                "oneWay": false,
                "lastTicketingDate": "2022-05-11",
                "numberOfBookableSeats": 9,
                "itineraries": [
                    {
                        "duration": "PT2H10M",
                        "segments": [
                            {
                                "departure": {
                                    "iataCode": "CDG",
                                    "terminal": "3",
                                    "at": "2022-07-04T20:45:00"
                                },
                                "arrival": {
                                    "iataCode": "MAD",
                                    "terminal": "4",
                                    "at": "2022-07-04T22:55:00"
                                },
                                "carrierCode": "IB",
                                "number": "3741",
                                "aircraft": {
                                    "code": "32A"
                                },
                                "operating": {
                                    "carrierCode": "I2"
                                },
                                "duration": "PT2H10M",
                                "id": "4",
                                "numberOfStops": 0,
                                "blacklistedInEU": false
                            }
                        ]
                    }
                ],
                "price": {
                    "currency": "EUR",
                    "total": "123.02",
                    "base": "92.00",
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
                    "grandTotal": "123.02",
                    "additionalServices": [
                        {
                            "amount": "30.00",
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
                    "IB"
                ],
                "travelerPricings": [
                    {
                        "travelerId": "1",
                        "fareOption": "STANDARD",
                        "travelerType": "ADULT",
                        "price": {
                            "currency": "EUR",
                            "total": "123.02",
                            "base": "92.00"
                        },
                        "fareDetailsBySegment": [
                            {
                                "segmentId": "4",
                                "cabin": "ECONOMY",
                                "fareBasis": "SDNNEOB2",
                                "brandedFare": "NOBAG",
                                "class": "S",
                                "includedCheckedBags": {
                                    "quantity": 0
                                }
                            }
                        ]
                    }
                ]
            }
        ],
        "payments": [
            {
                "brand": "VISA_IXARIS",
                "binNumber": 123456,
                "flightOfferIds": [
                    1
                ]
            }
        ]
    }
}'