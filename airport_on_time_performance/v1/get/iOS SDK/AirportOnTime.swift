import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

// Percentage of on-time flight departures for JFK Airport
amadeus.airport.predictions.onTime.get(params: ["airportCode": "JFK",
                                                "date": "2020-09-01"],
                                       onCompletion: {
                                           response, error in
                                           if error == nil {
                                               print(response!.data)
                                           }
                                        })
