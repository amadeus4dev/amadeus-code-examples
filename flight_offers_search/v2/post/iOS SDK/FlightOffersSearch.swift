import Amadeus
import Foundation
import SwiftyJSON

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

let jsonString: String = """
{
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
            "travelerType": "ADULT",
            "fareOptions": [
                "STANDARD"
            ]
        },
        {
            "id": "2",
            "travelerType": "CHILD",
            "fareOptions": [
                "STANDARD"
            ]
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
}  
"""

let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false)

do {
    let body: JSON = try JSON(data: dataFromString!)

    amadeus.shopping.flightOffersSearch.post(body: body,
    onCompletion: { result in
        switch result {
        case let .success(response):
            print(response.data)
        case let .failure(error):
            fatalError(error.localizedDescription)
        }
    })
} catch _ as NSError {
    assertionFailure("JSON not valid")
}
