import Amadeu

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.booking.flightOrder(flightOrderId: "eJzTd9f3NjIJdzUGAAp%2fAiY=").delete(
    onCompletion: {
        response, error in
        if error == nil {
            print(response!.data)
        }
                                        })
