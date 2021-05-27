import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.safety.safetyRatedLocation(locationId: "Q930402753").get(onCompletion: {
    result in
    switch result {
    case .success(let response):
        print(response.data)
    case .failure(let error):
        print(error.localizedDescription)
    }
})

