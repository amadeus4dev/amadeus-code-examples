const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Extract the information about point of interest with ID '9CB40CB5D0'
    const response = await amadeus.referenceData.locations
      .pointOfInterest("9CB40CB5D0")
      .get();

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
