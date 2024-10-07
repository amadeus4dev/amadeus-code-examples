const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Will there be a delay from BRU to FRA? If so how much delay?
    const response = await amadeus.travel.predictions.flightDelay.get({
      originLocationCode: "NCE",
      destinationLocationCode: "IST",
      departureDate: "2022-08-01",
      departureTime: "18:20:00",
      arrivalDate: "2022-08-01",
      arrivalTime: "22:15:00",
      aircraftCode: "321",
      carrierCode: "TK",
      flightNumber: "1816",
      duration: "PT31H10M",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
