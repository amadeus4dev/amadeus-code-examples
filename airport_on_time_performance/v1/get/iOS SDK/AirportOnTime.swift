import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

// Percentage of on-time flight departures for JFK Airport
amadeus.airport.predictions.onTime.get(params: ["airportCode": "JFK",
    "date": "2022-09-01"],
    onCompletion: { result in
        switch result {
        case let .success(response):
            print(response.data)
        case let .failure(error):
            fatalError(error.localizedDescription)
        }
    })
