const Amadeus = require("amadeus");

const amadeus = new Amadeus({
  clientId: "YOUR_API_KEY",
  clientSecret: "YOUR_API_SECRET",
});

async function main() {
  try {
    // Find the cheapest flights from SYD to BKK
    const response = await amadeus.shopping.flightOffersSearch.post({
      currencyCode: "USD",
      originDestinations: [
        {
          id: "1",
          originLocationCode: "SYD",
          destinationLocationCode: "BKK",
          departureDateTimeRange: {
            date: "2022-08-01",
            time: "10:00:00",
          },
        },
        {
          id: "2",
          originLocationCode: "BKK",
          destinationLocationCode: "SYD",
          departureDateTimeRange: {
            date: "2022-08-05",
            time: "17:00:00",
          },
        },
      ],
      travelers: [
        {
          id: "1",
          travelerType: "ADULT",
          fareOptions: ["STANDARD"],
        },
        {
          id: "2",
          travelerType: "CHILD",
          fareOptions: ["STANDARD"],
        },
      ],
      sources: ["GDS"],
      searchCriteria: {
        maxFlightOffers: 50,
        flightFilters: {
          cabinRestrictions: [
            {
              cabin: "BUSINESS",
              coverage: "MOST_SEGMENTS",
              originDestinationIds: ["1"],
            },
          ],
          carrierRestrictions: {
            excludedCarrierCodes: ["AA", "TP", "AZ"],
          },
        },
      },
    });

    console.log(response);
  } catch (error) {
    console.error(error);
  }
}

main();
