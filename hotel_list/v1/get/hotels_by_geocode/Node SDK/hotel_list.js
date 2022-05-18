var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// List of hotels in Paris 
amadeus.referenceData.locations.hotels.byGeocode.get({
  latitude: 48.83152,
  longitude: 2.24691
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});