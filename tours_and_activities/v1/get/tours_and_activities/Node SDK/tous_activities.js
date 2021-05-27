var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Returns activities for a location in Barcelona based on geolocation coordinates
amadeus.shopping.activities.get({
  latitude: 41.397158,
  longitude: 2.160873
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});
