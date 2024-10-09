const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // What travelers think about this hotel?
    const response = await amadeus.eReputation.hotelSentiments.get({
      hotelIds: "ADNYCCTB",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
