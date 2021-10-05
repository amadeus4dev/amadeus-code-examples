var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Will there be a delay from BRU to FRA? If so how much delay?
amadeus.travel.predictions.flightDelay.get({
  originLocationCode: 'NCE',
  destinationLocationCode: 'IST',
  departureDate: '2022-08-01',
  departureTime: '18:20:00',
  arrivalDate: '2022-08-01',
  arrivalTime: '22:15:00',
  aircraftCode: '321',
  carrierCode: 'TK',
  flightNumber: '1816',
  duration: 'PT31H10M'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});