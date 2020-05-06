import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.referenceData.urls.checkinLinks.get(params: ["airlineCode": "BA"],
                                            onCompletion: {
                                                response, error in
                                                if error == nil {
                                                    print(response!.data)
                                                }
    })
