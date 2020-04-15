var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// What's the airline name for the IATA code BA?
amadeus.referenceData.airlines.get({
  airlineCodes: 'BA'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});