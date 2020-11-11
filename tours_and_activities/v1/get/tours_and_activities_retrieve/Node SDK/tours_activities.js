var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Extract the information about an activity with ID '56777'
amadeus.shopping.activity('56777').get({
  north: 41.397158,
  west: 2.160873,
  south: 41.394582,
  east: 2.177181
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});
