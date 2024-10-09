const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Will there be a delay in the JFK airport on the 1st of September?
    const response = await amadeus.airport.predictions.onTime.get({
      airportCode: "JFK",
      date: "2022-09-01",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
