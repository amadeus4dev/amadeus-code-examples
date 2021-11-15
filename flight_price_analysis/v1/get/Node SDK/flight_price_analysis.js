var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});


// Am I getting a good deal on this flight?
amadeus.analytics.itineraryPriceMetrics.get({
  originIataCode: 'MAD',
  destinationIataCode: 'CDG',
  departureDate: '2022-01-13',
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});
