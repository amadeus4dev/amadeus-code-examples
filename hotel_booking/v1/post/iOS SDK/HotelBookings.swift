import Amadeus
import Foundation
import SwiftyJSON

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

let jsonString: String = """
{
  "data": {
    "offerId": "9AFAD70AF0E4E520F41E1AC743EADB9A1D83EF921A63013CA4E65FA9E8465F4F",
    "guests": [
      {
        "name": {
          "title": "MR",
          "firstName": "BOB",
          "lastName": "SMITH"
        },
        "contact": {
          "phone": "+33679278416",
          "email": "bob.smith@email.com"
        }
      }
    ],
    "payments": [
      {
        "method": "creditCard",
        "card": {
          "vendorCode": "VI",
          "cardNumber": "4111111111111111",
          "expiryDate": "2023-01"
        }
      }
    ]
  }
}
"""

let dataFromString = jsonString.data(using: .utf8, allowLossyConversion: false)

do {
    let body: JSON = try JSON(data: dataFromString!)

    amadeus.booking.hotelBookings.post(body: body,
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
