const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Which cities or airports start with ’r'?
    const response = await amadeus.referenceData.locations.get({
      keyword: "r",
      subType: Amadeus.location.any,
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
