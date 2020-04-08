var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Retrieve the flight-order with ID: XXX
amadeus.booking.flightOrder('XXX').get()
  .then(function (response) {
    console.log(response);
  }).catch(function (response) {
    console.error(response);
  });