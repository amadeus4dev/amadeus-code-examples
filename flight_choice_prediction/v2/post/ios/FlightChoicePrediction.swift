import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.shopping.flightOffersSearch.get(params: ["originLocationCode": "MAD",
                                                 "destinationLocationCode": "BER",
                                                 "departureDate": "2020-05-16",
                                                 "returnDate": "2020-05-30",
                                                 "adults": "2"],
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
