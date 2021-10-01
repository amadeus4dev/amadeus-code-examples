var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Will there be a delay in the JFK airport on the 1st of September?
amadeus.airport.predictions.onTime.get({
  airportCode: 'JFK',
  date: '2022-09-01'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});