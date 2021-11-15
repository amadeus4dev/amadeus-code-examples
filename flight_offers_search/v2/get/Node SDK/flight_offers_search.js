var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Find the cheapest flights from SYD to BKK
amadeus.shopping.flightOffersSearch.get({
  originLocationCode: 'SYD',
  destinationLocationCode: 'BKK',
  departureDate: '2022-08-01',
  adults: '2'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});