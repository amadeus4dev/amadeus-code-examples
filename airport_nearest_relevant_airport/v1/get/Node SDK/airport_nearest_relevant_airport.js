var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// What relevant airports are there around a specific location?
amadeus.referenceData.locations.airports.get({
  longitude: 2.55,
  latitude: 49.0000
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});