const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // What were the busiest months for Madrid in 2017?
    const response =
      await amadeus.travel.analytics.airTraffic.busiestPeriod.get({
        cityCode: "MAD",
        period: "2017",
        direction: Amadeus.direction.arriving,
      });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
