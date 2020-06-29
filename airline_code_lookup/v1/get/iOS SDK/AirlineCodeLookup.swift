import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.referenceData.airLines.get(params: ["airlineCodes": "BA"],
                                   onCompletion: {
                                       response, error in
                                       if error == nil {
                                           print(response!.data)
                                       }
                                        })
