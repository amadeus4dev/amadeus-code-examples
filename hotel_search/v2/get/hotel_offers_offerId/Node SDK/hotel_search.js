var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Confirm the availability of a specific offer
amadeus.shopping.hotelOffer('176383FB301E78D430F81A6CB6134EBF801DCC1AE14FC9DCCE84D17C6B519F5B').get()
  .then(function (response) {
    console.log(response);
  }).catch(function (response) {
    console.error(response);
  });