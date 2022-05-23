var Amadeus = require("amadeus");
var amadeus = new Amadeus({
    clientId: 'YOUR_API_KEY',
    clientSecret: 'YOUR_API_SECRET'
});

// Check offer conditions of a specific offer id
amadeus.shopping.hotelOfferSearch('63A93695B58821ABB0EC2B33FE9FAB24D72BF34B1BD7D707293763D8D9378FC3').get()
.then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});
