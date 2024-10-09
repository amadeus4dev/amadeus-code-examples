const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // What's the current status of my flight?
    const response = await amadeus.schedule.flights.get({
      carrierCode: "AZ",
      flightNumber: "319",
      scheduledDepartureDate: "2022-03-13",
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
