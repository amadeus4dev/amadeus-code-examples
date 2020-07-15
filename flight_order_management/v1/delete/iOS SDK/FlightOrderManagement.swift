import Amadeu

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

amadeus.booking.flightOrder(flightOrderId: "MlpZVkFMfFdBVFNPTnwyMDE1LTExLTAy").delete(
    onCompletion: {
        response, error in
        if error == nil {
            print(response!.data)
        }
                                        })
