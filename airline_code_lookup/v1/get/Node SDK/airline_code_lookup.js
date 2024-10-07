const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // What's the airline name for the IATA code BA?
    const response = await amadeus.referenceData.airlines.get({
      airlineCodes: "BA",
    });
    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
