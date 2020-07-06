import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

// Get a specific city or airport based on its id
amadeus.referenceData.location(locationId: "CMUC").get(onCompletion: {
    response, error in
    if error == nil {
        print(response!.data)
    }
                                        })
