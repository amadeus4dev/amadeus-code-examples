const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // What relevant airports are there around a specific location?
    const response = await amadeus.referenceData.locations.airports.get({
      longitude: 2.55,
      latitude: 49.0,
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
