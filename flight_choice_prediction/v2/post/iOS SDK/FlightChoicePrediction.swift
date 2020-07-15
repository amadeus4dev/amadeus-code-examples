import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.shopping.flightOffersSearch.get(params: ["originLocationCode": "MAD",
                                                 "destinationLocationCode": "NYC",
                                                 "departureDate": "2020-11-01",
                                                 "returnDate": "2020-11-09",
                                                 "adults": "1"],
                                        onCompletion: {
                                            response, error in
                                            if error == nil {
                                                amadeus.shopping.flightOffers.prediction.post(body: response!.result,
                                                                                              onCompletion: {
                                                                                                  prediction, _ in
                                                                                                  print(prediction!.data)
                                                })
                                            }
})
