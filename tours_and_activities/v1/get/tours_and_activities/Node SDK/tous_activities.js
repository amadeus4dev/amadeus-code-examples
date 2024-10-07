const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Returns activities for a location in Barcelona based on geolocation coordinates
    const response = await amadeus.shopping.activities.get({
      latitude: 41.397158,
      longitude: 2.160873,
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
