const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Find cheapest destinations from Madrid
    const response = await amadeus.shopping.flightDestinations.get({
      origin: "MAD",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
