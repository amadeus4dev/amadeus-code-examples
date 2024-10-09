const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Check offer conditions of a specific offer id
    const response = await amadeus.shopping
      .hotelOfferSearch(
        "63A93695B58821ABB0EC2B33FE9FAB24D72BF34B1BD7D707293763D8D9378FC3"
      )
      .get();

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
