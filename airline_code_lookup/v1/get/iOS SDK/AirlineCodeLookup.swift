import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.referenceData.airLines.get(params: ["airlineCodes": "BA"],
                                   onCompletion: { result in
                                       switch result {
                                       case let .success(response):
                                           print(response.data)
                                       case let .failure(error):
                                           fatalError(error.localizedDescription)
                                       }
                                   })
