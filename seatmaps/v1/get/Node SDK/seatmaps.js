const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Returns all the seat maps of a given order
    const response = await amadeus.shopping.seatmaps.get({
      "flight-orderId": "eJzTd9cPDPMwcooAAAtXAmE=",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
