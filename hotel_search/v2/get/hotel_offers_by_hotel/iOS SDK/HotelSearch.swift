import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

// Get list of offers for a specific hotel
amadeus.shopping.hotelOfferByHotel.get(params: ["hotelId": "BGMILBGB",
                                                "adults": "2",
                                                "roomQuantity": "1",
                                                "paymentPolicy": "NONE"],
                                       onCompletion: {
                                           response, error in
                                           if error == nil {
                                               print(response!.data)
                                           }
                                        })
