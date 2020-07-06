import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.shopping.seatMaps.get(params: ["flight-orderId": "eJzTd9f3NjIJdzUGAAp%2fAiY="],
                              onCompletion: {
                                  response, error in
                                  if error == nil {
                                      print(response!.data)
                                  }
                            })
