import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

// Get list of hotels by city code
amadeus.shopping.hotelOffers.get(params: ["cityCode": "PAR"],
                                 onCompletion: {
                                     response, error in
                                     if error == nil {
                                         print(response!.data)
                                     }
                                        })
