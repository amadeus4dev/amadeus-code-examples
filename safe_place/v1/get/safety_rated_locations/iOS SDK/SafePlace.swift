import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

// How safe is Barcelona? (based a geo location and a radius)
amadeus.safety.safetyRatedLocations.get(params: ["latitude": "41.397158",
                                                 "longitude": "2.160873",
                                                 "radius": "2"],
                                                     onCompletion: {
                                                            result in
                                                            switch result {
                                                            case .success(let response):
                                                                print(response.data)
                                                            case .failure(let error):
                                                                print(error.localizedDescription)
                                                            }
                                        })
