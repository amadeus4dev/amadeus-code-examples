import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)


amadeus.shopping.flightOffersSearch.get(params:
   ["originLocationCode": "MAD",
    "destinationLocationCode": "BER",
    "departureDate": "2021-05-16",
    "returnDate": "2021-05-30",
    "adults": "2"],
    onCompletion: { result in

        switch result {
        case let .success(response):
            self.amadeus.shopping.flightOffers.prediction.post(body: response.result, onCompletion: {
                                                                   predictionResult in

                                                                   switch predictionResult {
                                                                   case let .success(response):
                                                                       print(response.data)
                                                                   case let .failure(error):
                                                                       fatalError(error.localizedDescription)
                                                                   }
                                                               })
        case let .failure(error):
            fatalError(error.localizedDescription)
        }
    })
