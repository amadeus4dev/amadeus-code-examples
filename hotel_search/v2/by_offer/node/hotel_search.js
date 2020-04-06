var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Confirm the availability of a specific offer
amadeus.shopping.hotelOffer('XXX').get()
  .then(function (response) {
    console.log(response);
  }).catch(function (response) {
    console.error(response);
  });