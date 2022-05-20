var Amadeus = require("amadeus");
var amadeus = new Amadeus({
    clientId: 'YOUR_API_KEY',
    clientSecret: 'YOUR_API_SECRET'
});

// Get list of available offers in specific hotels by hotel ids
amadeus.shopping.hotelOffersSearch.get({
    hotelIds: 'RTPAR001',
    adults: '2'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});
