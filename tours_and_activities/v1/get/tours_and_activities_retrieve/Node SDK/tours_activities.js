const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Extract the information about an activity with ID '56777'
    const response = await amadeus.shopping.activity("56777").get({
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
