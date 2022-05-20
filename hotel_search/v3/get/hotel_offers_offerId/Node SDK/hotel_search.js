var Amadeus = require("amadeus");
var amadeus = new Amadeus({
    clientId: 'YOUR_API_KEY',
    clientSecret: 'YOUR_API_SECRET'
});

// Check offer conditions of a specific offer id
amadeus.shopping.hotelOfferSearch('XXX').get()
.then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});
