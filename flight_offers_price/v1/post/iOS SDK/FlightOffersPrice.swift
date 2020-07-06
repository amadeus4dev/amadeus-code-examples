import Amadeus
import Foundation
import SwiftyJSON

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

// Build the body from the first flight offer returned by
// Flight Offers Search API response array
let jsonString: String = """
{
   'data': {
    'type': 'flight-offers-pricing',
    'flightOffers': \(flightOffersSearchResponse.data[0])
}
"""

let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false)

do {
    let body: JSON = try JSON(data: dataFromString!)

    amadeus.shopping.flightOffers.pricing.post(body: body, onCompletion: {
        response, error in
        if error == nil {
            print(response!.data)
        }
                                             })
} catch _ as NSError {
    assertionFailure("JSON not valid")
}
