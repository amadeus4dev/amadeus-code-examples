var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Get list of Hotels by city code
amadeus.shopping.hotelOffers.get({
  cityCode: 'MAD'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});