import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

// What are the popular places in Barcelona?
amadeus.referenceData.locations.pointsOfInterest.get(params: ["latitude": "41.397158",
    "longitude": "2.160873",
    "radius": "2"],
    onCompletion: { result in
        switch result {
        case let .success(response):
            print(response.data)
        case let .failure(error):
            fatalError(error.localizedDescription)
        }
    })
