const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Finds cities that match a specific word or string of letters.
    // Return a list of cities matching a keyword 'Paris'
    const response = await amadeus.referenceData.locations.cities.get({
      keyword: "Paris",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
