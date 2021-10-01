var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// What's the current status of my flight?
amadeus.schedule.flights.get({
  carrierCode: 'AZ',
  flightNumber: '319',
  scheduledDepartureDate: '2022-03-13'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});
