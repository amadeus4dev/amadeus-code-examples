import Amadeus
import Foundation
import SwiftyJSON

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

let jsonString: String = """
{
    "data": [
        {
            "type": "flight-offer",
            "id": "1",
            "source": "GDS",
            "instantTicketingRequired": false,
            "nonHomogeneous": false,
            "oneWay": false,
            "lastTicketingDate": "2020-03-07",
            "numberOfBookableSeats": 9,
            "itineraries": [
                {
                    "duration": "PT15H15M",
                    "segments": [
                        {
                            "departure": {
                                "iataCode": "NCE",
                                "terminal": "1",
                                "at": "2020-09-26T06:00:00"
                            },
                            "arrival": {
                                "iataCode": "LIS",
                                "terminal": "1",
                                "at": "2020-09-26T07:35:00"
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
                                "at": "2020-09-26T12:15:00"
                            },
                            "arrival": {
                                "iataCode": "EWR",
                                "terminal": "B",
                                "at": "2020-09-26T15:15:00"
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
                    Swiftformat completed successfully.
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
}
"""

let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false)

do {
    let body: JSON = try JSON(data: dataFromString!)

    amadeus.shopping.seatMaps.post(body: body, onCompletion: {
        response, error in
        if error == nil {
            print(response!.data)
        }
    })
} catch _ as NSError {
    assertionFailure("JSON not valid")
}
