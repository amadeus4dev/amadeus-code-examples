import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.travel.tripParserJobs.status(jobId: "JKKSJNMSKHJ").get(
    onCompletion: {
        response, error in
        if error == nil {
            print(response!.data)
        }
                                        })
