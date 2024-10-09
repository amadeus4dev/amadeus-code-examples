const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Find all destinations served by CDG Airport
    const response = await amadeus.airport.directDestinations.get({
      departureAirportCode: "MAD",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
