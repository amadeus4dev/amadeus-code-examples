const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Returns all the seat maps of a given flightOffer
    const flightOffersResponse = await amadeus.shopping.flightOffersSearch.get({
      originLocationCode: "SYD",
      destinationLocationCode: "BKK",
      departureDate: "2022-08-01",
      adults: "2",
    });

    const response = await amadeus.shopping.seatmaps.post({
      data: [flightOffersResponse.data[0]],
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
