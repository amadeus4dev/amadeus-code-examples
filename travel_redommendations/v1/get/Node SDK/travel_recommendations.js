const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Recommended locations similar to PAR
    const response = await amadeus.referenceData.recommendedLocations.get({
      cityCodes: "PAR",
      travelerCountryCode: "FR",
    });

    console.log(response);
  } catch (error) {
    console.log(error);
  }
}

main();
