const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});
// Or `const amadeus = new Amadeus()` if the environment variables are set

async function main() {
  try {
    // Hotel name autocomplete for keyword 'PARI' using  HOTEL_GDS category of search
    const response = await amadeus.referenceData.locations.hotel.get({
      keyword: "PARI",
      subType: "HOTEL_GDS",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
