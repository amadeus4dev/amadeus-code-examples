const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Find the cheapest flights from SYD to BKK
    const response = await amadeus.shopping.flightOffersSearch.get({
      originLocationCode: "SYD",
      destinationLocationCode: "BKK",
      departureDate: "2022-08-01",
      adults: "2",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
