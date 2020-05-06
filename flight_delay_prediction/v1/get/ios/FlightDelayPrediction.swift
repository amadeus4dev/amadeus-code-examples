import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.travel.predictions.flightDelay.get(data: ["originLocationCode": "NCE",
                                                  "destinationLocationCode": "IST",
                                                  "departureDate": "2020-08-01",
                                                  "departureTime": "18:20:00",
                                                  "arrivalDate": "2020-08-01",
                                                  "arrivalTime": "22:15:00",
                                                  "aircraftCode": "321",
                                                  "carrierCode": "TK",
                                                  "flightNumber": "1816",
                                                  "duration": "PT31H10M"],
                                           onCompletion: {
                                               response, error in
                                               if error == nil {
                                                   print(response!.data)
                                               }
    })
