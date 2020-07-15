import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

/// Airport & City Search (autocomplete)
/// Find all the cities and airports starting by the keyword 'LON'
amadeus.referenceData.locations.get(params: ["subType": "AIRPORT,CITY",
                                             "keyword": "LON"],
                                    onCompletion: {
                                        response, error in
                                        if error == nil {
                                            print(response!.data)
                                        }
                                        })
