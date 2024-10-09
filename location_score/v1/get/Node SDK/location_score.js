const Amadeus = require("amadeus");

const amadeus = new Amadeus();

async function main() {
  try {
    //What are the location scores for the given coordinates?
    const response = await amadeus.location.analytics.categoryRatedAreas.get({
      latitude: 41.397158,
      longitude: 2.160873,
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
