const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_AMADEUS_API_KEY",
  clientSecret: "YOUR_AMADEUS_API_SECRET",
});

async function main() {
  try {
    const response = await amadeus.shopping.transferOffers.post({
      startLocationCode: "CDG",
      endAddressLine: "Avenue Anatole France, 5",
      endCityName: "Paris",
      endZipCode: "75007",
      endCountryCode: "FR",
      endName: "Souvenirs De La Tour",
      endGeoCode: "48.859466,2.2976965",
      transferType: "PRIVATE",
      startDateTime: "2023-11-10T10:30:00",
      providerCodes: "TXO",
      passengers: 2,
      stopOvers: [
        {
          duration: "PT2H30M",
          sequenceNumber: 1,
          addressLine: "Avenue de la Bourdonnais, 19",
          countryCode: "FR",
          cityName: "Paris",
          zipCode: "75007",
          name: "De La Tours",
          geoCode: "48.859477,2.2976985",
          stateCode: "FR",
        },
      ],
      startConnectedSegment: {
        transportationType: "FLIGHT",
        transportationNumber: "AF380",
        departure: {
          localDateTime: "2023-11-10T09:00:00",
          iataCode: "NCE",
        },
        arrival: {
          localDateTime: "2023-11-10T10:00:00",
          iataCode: "CDG",
        },
      },
      passengerCharacteristics: [
        {
          passengerTypeCode: "ADT",
          age: 20,
        },
        {
          passengerTypeCode: "CHD",
          age: 10,
        },
      ],
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
