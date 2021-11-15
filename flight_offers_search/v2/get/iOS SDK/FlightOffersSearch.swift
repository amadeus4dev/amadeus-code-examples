import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.shopping.flightOffersSearch.get(params: ["originLocationCode": "MAD",
    "destinationLocationCode": "BER",
    "departureDate": "2022-09-16",
    "returnDate": "2022-09-30",
    "adults": "2"],
    onCompletion: { result in
        switch result {
        case let .success(response):
            print(response.data)
        case let .failure(error):
            fatalError(error.localizedDescription)
        }
    })
