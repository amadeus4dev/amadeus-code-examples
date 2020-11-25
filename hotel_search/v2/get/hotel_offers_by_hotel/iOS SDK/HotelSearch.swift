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
    onCompletion: { result in
        switch result {
        case let .success(response):
            print(response.data)
        case let .failure(error):
            fatalError(error.localizedDescription)
        }
    })
