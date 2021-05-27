import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

/// Find all the cities and airports starting by the keyword 'LON'
amadeus.referenceData.locations.get(params: ["subType": "AIRPORT,CITY",
    "keyword": "LON"],
    onCompletion: { result in
        switch result {
        case let .success(response):
            print(response.data)
        case let .failure(error):
            fatalError(error.localizedDescription)
        }
    })
