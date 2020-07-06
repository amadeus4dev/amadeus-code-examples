import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

// What are the popular places in Barcelona? (based on a square)
amadeus.referenceData.locations.pointsOfInterest.bySquare.get(params: ["north": "41.397158",
                                                                       "west": "2.160873",
                                                                       "south": "41.394582",
                                                                       "east": "2.177181"],
                                                              onCompletion: {
                                                                  response, error in
                                                                  if error == nil {
                                                                      print(response!.data)
                                                                  }
    })
