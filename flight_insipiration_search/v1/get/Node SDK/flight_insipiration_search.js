var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Find cheapest destinations from Madrid
amadeus.shopping.flightDestinations.get({
  origin: 'MAD'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});