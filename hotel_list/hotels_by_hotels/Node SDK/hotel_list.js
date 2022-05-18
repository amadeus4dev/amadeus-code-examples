var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Get Marriot Hotel information in Paris
amadeus.referenceData.locations.hotels.byHotels.get({
  hotelIds: 'ARPARARA'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});