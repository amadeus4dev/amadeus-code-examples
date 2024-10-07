const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // The passenger is traveling for leisure or business?
    const response = await amadeus.travel.predictions.tripPurpose.get({
      originLocationCode: "NYC",
      destinationLocationCode: "MAD",
      departureDate: "2022-08-01",
      returnDate: "2022-08-12",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
