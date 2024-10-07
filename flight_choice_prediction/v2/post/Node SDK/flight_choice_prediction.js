const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    const flightOffersResponse = await amadeus.shopping.flightOffersSearch.get({
      originLocationCode: "SYD",
      destinationLocationCode: "BKK",
      departureDate: "2022-08-01",
      adults: "2",
    });
    const response = await amadeus.shopping.flightOffers.prediction.post(
      flightOffersResponse
    );
    console.log(response.data);
  } catch (error) {
    console.error(error);
  }
}

main();
