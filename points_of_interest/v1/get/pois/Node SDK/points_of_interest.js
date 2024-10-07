const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // What are the popular places in Barcelona (based on a geo location and a radius)
    const response = await amadeus.referenceData.locations.pointsOfInterest.get(
      {
        latitude: 41.397158,
        longitude: 2.160873,
      }
    );

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
