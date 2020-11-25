import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)


amadeus.safety.safetyRatedLocations.bySquare.get(params: ["north": "41.397158",
    "west": "2.160873",
    "south": "41.394582",
    "east": "2.177181"], onCompletion: {
        result in
        switch result {
        case .success(let response):
            print(response.data)
        case .failure(let error):
            print(error.localizedDescription)
        }
    })
