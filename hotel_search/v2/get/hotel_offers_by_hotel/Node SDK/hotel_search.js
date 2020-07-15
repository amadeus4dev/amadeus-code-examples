var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Get list of offers for a specific hotel
amadeus.shopping.hotelOffersByHotel.get({
  hotelId: 'BGMILBGB'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});