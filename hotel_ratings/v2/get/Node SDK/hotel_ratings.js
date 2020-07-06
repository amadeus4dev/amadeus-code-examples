var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// What travelers think about this hotel?
amadeus.eReputation.hotelSentiments.get({
  hotelIds: 'ADNYCCTB'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});