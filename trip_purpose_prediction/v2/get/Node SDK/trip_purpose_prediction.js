var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// The passenger is traveling for leisure or business?
amadeus.travel.predictions.tripPurpose.get({
  originLocationCode: 'NYC',
  destinationLocationCode: 'MAD',
  departureDate: '2022-08-01',
  returnDate: '2022-08-12'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});