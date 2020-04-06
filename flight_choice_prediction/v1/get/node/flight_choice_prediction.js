var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Find the probability of the flight MAD to NYC to be chosen
amadeus.shopping.flightOffers.get({
  origin: 'MAD',
  destination: 'NYC',
  departureDate: '2020-10-01'
}).then(function (response) {
  return amadeus.shopping.flightOffers.prediction.post(
    JSON.stringify(response.result)
  );
}).then(function (response) {
  console.log(response.data);
}).catch(function (responseError) {
  console.log(responseError);
});