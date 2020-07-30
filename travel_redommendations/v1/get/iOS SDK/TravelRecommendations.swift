
        

amadeus.referenceData.recommendedLocations.get(params: ["cityCodes": "PAR",
                                                        "travelerCountryCode": "FR"], 
                                                        onCompletion: { 
                                                          result in
                                                              switch result {
                                                              case let .success(response):
                                                                  print(response.data)
                                                              case let .failure(error):
                                                                  print(error.localizedDescription)
                                                              }
        })

