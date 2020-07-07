var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// How safe is Barcelona? (based on a square)
amadeus.safety.safetyRatedLocations.bySquare.get({
  north: 41.397158,
  west: 2.160873,
  south: 41.394582,
  east: 2.177181
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});