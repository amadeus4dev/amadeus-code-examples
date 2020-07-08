var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Find cheapest dates from Madrid to Munich
amadeus.shopping.flightDates.get({
  origin: 'MAD',
  destination: 'MUC'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});