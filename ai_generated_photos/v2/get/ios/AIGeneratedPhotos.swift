import Amadeus

var amadeus: Amadeus = Amadeus(
    client_id: "YOUR_API_ID",
    client_secret: "YOUR_API_SECRET"
)

/// Generates a fake mountain image
amadeus.media.files.generatedPhotos.get(params: ["category": "MOUNTAIN"],
                                        onCompletion: {
                                            response, error in
                                            if error == nil {
                                                print(response!.data)
                                            }
                                        })
