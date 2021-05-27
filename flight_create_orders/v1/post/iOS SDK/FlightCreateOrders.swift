import Amadeus
import Foundation
import SwiftyJSON

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

// Build the body from the first flight offer returned by
// Flight Offers Price API response array
let jsonString: String = """
{
  'data': {
    'type': 'flight-order',
    'flightOffers': \(response.result.data[0].flightOffers[0]),
    'travelers': [{
      "id": "1",
      "dateOfBirth": "1982-01-16",
      "name": {
        "firstName": "JORGE",
        "lastName": "GONZALES"
      },
      "gender": "MALE",
      "contact": {
        "emailAddress": "jorge.gonzales833@telefonica.es",
        "phones": [{
          "deviceType": "MOBILE",
          "countryCallingCode": "34",
          "number": "480080076"
        }]
      },
      "documents": [{
        "documentType": "PASSPORT",
        "birthPlace": "Madrid",
        "issuanceLocation": "Madrid",
        "issuanceDate": "2015-04-14",
        "number": "00000000",
        "expiryDate": "2025-04-14",
        "issuanceCountry": "ES",
        "validityCountry": "ES",
        "nationality": "ES",
        "holder": true
      }]
    }]
  }
}
"""

let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false)

do {
    let body: JSON = try JSON(data: dataFromString)

    amadeus.booking.flightOrders.post(body: body,
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
