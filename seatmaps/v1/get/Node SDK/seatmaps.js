var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Returns all the seat maps of a given order
amadeus.shopping.seatmaps.get({
  'flight-orderId': 'eJzTd9cPDPMwcooAAAtXAmE='
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});