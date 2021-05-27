import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.travel.predictions.flightDelay.get(data: ["originLocationCode": "NCE",
    "destinationLocationCode": "IST",
    "departureDate": "2021-05-01",
    "departureTime": "18:20:00",
    "arrivalDate": "2021-05-01",
    "arrivalTime": "22:15:00",
    "aircraftCode": "321",
    "carrierCode": "TK",
    "flightNumber": "1816",
    "duration": "PT31H10M"],
    onCompletion: { result in
        switch result {
        case let .success(response):
            print(response.data)
        case let .failure(error):
            fatalError(error.localizedDescription)
        }
    })

