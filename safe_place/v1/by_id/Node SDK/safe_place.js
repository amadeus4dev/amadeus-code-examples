var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// What is the safety information of a location based on it's Id?
amadeus.safety.safetyRatedLocation('Q930400801').get().then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});