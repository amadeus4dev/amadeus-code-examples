import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

let hotelId = "176383FB301E78D430F81A6CB6134EBF801DCC1AE14FC9DCCE84D17C6B519F5B"

amadeus.shopping.hotelOffer(hotelId: hotelId).get(
    onCompletion: {
        response, error in
        if error == nil {
            print(response!.data)
        }
                                        })
