import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.referenceData.locations.pointOfInterest(poiId: "9CB40CB5D0").get(
    onCompletion: {
        response, error in
        if error == nil {
            print(response!.data)
        }
    })
