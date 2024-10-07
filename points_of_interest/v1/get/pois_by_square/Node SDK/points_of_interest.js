const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // What are the popular places in Barcelona? (based on a square)
    const response =
      await amadeus.referenceData.locations.pointsOfInterest.bySquare.get({
        north: 41.397158,
        west: 2.160873,
        south: 41.394582,
        east: 2.177181,
      });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
