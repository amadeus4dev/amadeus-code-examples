import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

// Airport Nearest Relevant (for London)
amadeus.referenceData.locations.airports.get(params: ["longitude": "49.0000",
                                                      "latitude": "2.55"],
                                             onCompletion: {
                                                 response, error in
                                                 if error == nil {
                                                     print(response!.data)
                                                 }
                                        })
