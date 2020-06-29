var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Will there be a delay from BRU to FRA? If so how much delay?
amadeus.travel.predictions.flightDelay.get({
  originLocationCode: 'BRU',
  destinationLocationCode: 'FRA',
  departureDate: '2020-01-14',
  departureTime: '11:05:00',
  arrivalDate: '2020-01-14',
  arrivalTime: '12:10:00',
  aircraftCode: '32A',
  carrierCode: 'LH',
  flightNumber: '1009',
  duration: 'PT1H05M'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});