const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Am I getting a good deal on this flight?
    const response = await amadeus.analytics.itineraryPriceMetrics.get({
      originIataCode: "MAD",
      destinationIataCode: "CDG",
      departureDate: "2022-01-13",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
