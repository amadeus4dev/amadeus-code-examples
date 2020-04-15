# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

curl -X POST -H "Authorization: Bearer $ACCESS_TOKEN" \
-H "Content-Type: application/json" \
https://test.api.amadeus.com/v1/shopping/flight-offers/prediction \
-d '{
    "data": [
        {
            "type": "flight-offer",
            "id": "1578926714812--1338691498",
            "offerItems": [
                {
                    "services": [
                        {
                            "segments": [
                                {
                                    "flightSegment": {
                                        "departure": {
                                            "iataCode": "MAD",
                                            "terminal": "1",
                                            "at": "2020-10-01T12:10:00+02:00"
                                        },
                                        "arrival": {
                                            "iataCode": "IST",
                                            "at": "2020-10-01T17:25:00+03:00"
                                        },
                                        "carrierCode": "TK",
                                        "number": "1858",
                                        "aircraft": {
                                            "code": "333"
                                        },
                                        "operating": {
                                            "carrierCode": "TK",
                                            "number": "1858"
                                        },
                                        "duration": "0DT4H15M"
                                    },
                                    "pricingDetailPerAdult": {
                                        "travelClass": "ECONOMY",
                                        "fareClass": "Q",
                                        "availability": 9,
                                        "fareBasis": "QN2PXOW"
                                    }
                                },
                                {
                                    "flightSegment": {
                                        "departure": {
                                            "iataCode": "IST",
                                            "at": "2020-10-01T18:35:00+03:00"
                                        },
                                        "arrival": {
                                            "iataCode": "JFK",
                                            "terminal": "1",
                                            "at": "2020-10-01T22:30:00-04:00"
                                        },
                                        "carrierCode": "TK",
                                        "number": "11",
                                        "aircraft": {
                                            "code": "789"
                                        },
                                        "operating": {
                                            "carrierCode": "TK",
                                            "number": "11"
                                        },
                                        "duration": "0DT10H55M"
                                    },
                                    "pricingDetailPerAdult": {
                                        "travelClass": "ECONOMY",
                                        "fareClass": "Q",
                                        "availability": 9,
                                        "fareBasis": "QN2PXOW"
                                    }
                                }
                            ]
                        }
                    ],
                    "price": {
                        "total": "477.58",
                        "totalTaxes": "246.58"
                    },
                    "pricePerAdult": {
                        "total": "477.58",
                        "totalTaxes": "246.58"
                    }
                }
            ]
        },
        {
            "type": "flight-offer",
            "id": "1578926714812--613833458",
            "offerItems": [
                {
                    "services": [
                        {
                            "segments": [
                                {
                                    "flightSegment": {
                                        "departure": {
                                            "iataCode": "MAD",
                                            "terminal": "4S",
                                            "at": "2020-10-01T13:50:00+02:00"
                                        },
                                        "arrival": {
                                            "iataCode": "CMN",
                                            "terminal": "2",
                                            "at": "2020-10-01T14:40:00+01:00"
                                        },
                                        "carrierCode": "AT",
                                        "number": "973",
                                        "aircraft": {
                                            "code": "73H"
                                        },
                                        "operating": {
                                            "carrierCode": "AT",
                                            "number": "973"
                                        },
                                        "duration": "0DT1H50M"
                                    },
                                    "pricingDetailPerAdult": {
                                        "travelClass": "ECONOMY",
                                        "fareClass": "V",
                                        "availability": 9,
                                        "fareBasis": "VA0WAEUA"
                                    }
                                },
                                {
                                    "flightSegment": {
                                        "departure": {
                                            "iataCode": "CMN",
                                            "terminal": "1",
                                            "at": "2020-10-01T16:10:00+01:00"
                                        },
                                        "arrival": {
                                            "iataCode": "JFK",
                                            "at": "2020-10-01T19:00:00-04:00"
                                        },
                                        "carrierCode": "AT",
                                        "number": "200",
                                        "aircraft": {
                                            "code": "789"
                                        },
                                        "operating": {
                                            "carrierCode": "AT",
                                            "number": "200"
                                        },
                                        "duration": "0DT7H50M"
                                    },
                                    "pricingDetailPerAdult": {
                                        "travelClass": "ECONOMY",
                                        "fareClass": "V",
                                        "availability": 9,
                                        "fareBasis": "VA0WAEUA"
                                    }
                                }
                            ]
                        }
                    ],
                    "price": {
                        "total": "574.44",
                        "totalTaxes": "238.44"
                    },
                    "pricePerAdult": {
                        "total": "574.44",
                        "totalTaxes": "238.44"
                    }
                }
            ]
        },
        {
            "type": "flight-offer",
            "id": "1578926714812--1240439244",
            "offerItems": [
                {
                    "services": [
                        {
                            "segments": [
                                {
                                    "flightSegment": {
                                        "departure": {
                                            "iataCode": "MAD",
                                            "terminal": "3",
                                            "at": "2020-10-01T10:05:00+02:00"
                                        },
                                        "arrival": {
                                            "iataCode": "LHR",
                                            "terminal": "1",
                                            "at": "2020-10-01T11:30:00+01:00"
                                        },
                                        "carrierCode": "6X",
                                        "number": "459",
                                        "aircraft": {
                                            "code": "32S"
                                        },
                                        "operating": {
                                            "carrierCode": "6X",
                                            "number": "459"
                                        },
                                        "duration": "0DT2H25M"
                                    },
                                    "pricingDetailPerAdult": {
                                        "travelClass": "ECONOMY",
                                        "fareClass": "B",
                                        "availability": 9,
                                        "fareBasis": "BMADNYC"
                                    }
                                },
                                {
                                    "flightSegment": {
                                        "departure": {
                                            "iataCode": "LHR",
                                            "at": "2020-10-01T13:40:00+01:00"
                                        },
                                        "arrival": {
                                            "iataCode": "JFK",
                                            "at": "2020-10-01T16:25:00-04:00"
                                        },
                                        "carrierCode": "6X",
                                        "number": "140",
                                        "aircraft": {
                                            "code": "747"
                                        },
                                        "operating": {
                                            "carrierCode": "6X",
                                            "number": "140"
                                        },
                                        "duration": "0DT7H45M"
                                    },
                                    "pricingDetailPerAdult": {
                                        "travelClass": "ECONOMY",
                                        "fareClass": "B",
                                        "availability": 9,
                                        "fareBasis": "BMADNYC"
                                    }
                                }
                            ]
                        }
                    ],
                    "price": {
                        "total": "494.72",
                        "totalTaxes": "94.72"
                    },
                    "pricePerAdult": {
                        "total": "494.72",
                        "totalTaxes": "94.72"
                    }
                }
            ]
        },
        {
            "type": "flight-offer",
            "id": "1578926714812--1901470069",
            "offerItems": [
                {
                    "services": [
                        {
                            "segments": [
                                {
                                    "flightSegment": {
                                        "departure": {
                                            "iataCode": "MAD",
                                            "terminal": "1",
                                            "at": "2020-10-01T12:00:00+02:00"
                                        },
                                        "arrival": {
                                            "iataCode": "SVO",
                                            "terminal": "D",
                                            "at": "2020-10-01T17:50:00+03:00"
                                        },
                                        "carrierCode": "SU",
                                        "number": "2501",
                                        "aircraft": {
                                            "code": "32B"
                                        },
                                        "operating": {
                                            "carrierCode": "SU",
                                            "number": "2501"
                                        },
                                        "duration": "0DT4H50M"
                                    },
                                    "pricingDetailPerAdult": {
                                        "travelClass": "ECONOMY",
                                        "fareClass": "R",
                                        "availability": 7,
                                        "fareBasis": "RVOLA"
                                    }
                                },
                                {
                                    "flightSegment": {
                                        "departure": {
                                            "iataCode": "SVO",
                                            "terminal": "D",
                                            "at": "2020-10-01T19:40:00+03:00"
                                        },
                                        "arrival": {
                                            "iataCode": "JFK",
                                            "terminal": "1",
                                            "at": "2020-10-01T23:10:00-04:00"
                                        },
                                        "carrierCode": "SU",
                                        "number": "122",
                                        "aircraft": {
                                            "code": "359"
                                        },
                                        "operating": {
                                            "carrierCode": "SU",
                                            "number": "122"
                                        },
                                        "duration": "0DT10H30M"
                                    },
                                    "pricingDetailPerAdult": {
                                        "travelClass": "ECONOMY",
                                        "fareClass": "R",
                                        "availability": 7,
                                        "fareBasis": "RVOLA"
                                    }
                                }
                            ]
                        }
                    ],
                    "price": {
                        "total": "333.04",
                        "totalTaxes": "228.04"
                    },
                    "pricePerAdult": {
                        "total": "333.04",
                        "totalTaxes": "228.04"
                    }
                }
            ]
        },
        {
            "type": "flight-offer",
            "id": "1578926714812-1054183087",
            "offerItems": [
                {
                    "services": [
                        {
                            "segments": [
                                {
                                    "flightSegment": {
                                        "departure": {
                                            "iataCode": "MAD",
                                            "terminal": "1",
                                            "at": "2020-10-01T15:35:00+02:00"
                                        },
                                        "arrival": {
                                            "iataCode": "JFK",
                                            "terminal": "4",
                                            "at": "2020-10-01T17:45:00-04:00"
                                        },
                                        "carrierCode": "UX",
                                        "number": "91",
                                        "aircraft": {
                                            "code": "789"
                                        },
                                        "operating": {
                                            "carrierCode": "UX",
                                            "number": "91"
                                        },
                                        "duration": "0DT8H10M"
                                    },
                                    "pricingDetailPerAdult": {
                                        "travelClass": "ECONOMY",
                                        "fareClass": "B",
                                        "availability": 9,
                                        "fareBasis": "BYYOEA"
                                    }
                                }
                            ]
                        }
                    ],
                    "price": {
                        "total": "1784.58",
                        "totalTaxes": "177.58"
                    },
                    "pricePerAdult": {
                        "total": "1784.58",
                        "totalTaxes": "177.58"
                    }
                }
            ]
        }
    ],
    "dictionaries": {
        "carriers": {
            "6X": "AMADEUS SIX",
            "SU": "AEROFLOT",
            "AT": "ROYAL AIR MAROC",
            "UX": "AIR EUROPA",
            "TK": "TURKISH AIRLINES"
        },
        "currencies": {
            "EUR": "EURO"
        },
        "aircraft": {
            "32B": "AIRBUS INDUSTRIE A321 SHARKLETS",
            "333": "AIRBUS INDUSTRIE A330-300",
            "32S": "AIRBUS INDUSTRIE A318/A319/A320/A321",
            "359": "AIRBUS INDUSTRIE A350-900",
            "789": "BOEING 787-9",
            "747": "BOEING 747 ALL SERIES PASSENGER",
            "73H": "BOEING 737-800 (WINGLETS)"
        },
        "locations": {
            "MAD": {
                "subType": "AIRPORT",
                "detailedName": "ADOLFO SUAREZ BARAJAS"
            },
            "CMN": {
                "subType": "AIRPORT",
                "detailedName": "MOHAMMED V"
            },
            "LHR": {
                "subType": "AIRPORT",
                "detailedName": "HEATHROW"
            },
            "IST": {
                "subType": "AIRPORT",
                "detailedName": "ISTANBUL AIRPORT"
            },
            "SVO": {
                "subType": "AIRPORT",
                "detailedName": "SHEREMETYEVO"
            },
            "JFK": {
                "subType": "AIRPORT",
                "detailedName": "JOHN F KENNEDY INTL"
            }
        }
    },
    "meta": {
        "links": {
            "self": "https://test.api.amadeus.com/v1/shopping/flight-offers?origin=MAD&destination=NYC&departureDate=2020-10-01&adults=1&nonStop=false&max=5"
        },
        "currency": "EUR",
        "defaults": {
            "nonStop": false,
            "adults": 1
        }
    }
}'