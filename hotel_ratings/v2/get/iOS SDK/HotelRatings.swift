import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

// Hotel Ratings / Sentiments
amadeus.eReputation.hotelSentiments.get(params: ["hotelIds": "TELONMFS,ADNYCCTB,XXXYYY01"],
                                        onCompletion: {
                                            response, error in
                                            if error == nil {
                                                print(response!.data)
                                            }
                                        })
