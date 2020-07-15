import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.shopping.flightDestinations.get(params: ["origin": "MAD"],
                                        onCompletion: {
                                            response, error in
                                            if error == nil {
                                                print(response!.data)
                                            }
                                        })
