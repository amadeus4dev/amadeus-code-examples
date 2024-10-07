const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // List of hotels in Paris
    const response = await amadeus.referenceData.locations.hotels.byGeocode.get(
      {
        latitude: 48.83152,
        longitude: 2.24691,
      }
    );

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
