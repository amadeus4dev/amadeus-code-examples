var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// What are the popular places in Barcelona (based a geo location and a radius)
amadeus.referenceData.locations.pointsOfInterest.get({
  latitude: 41.397158,
  longitude: 2.160873
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});