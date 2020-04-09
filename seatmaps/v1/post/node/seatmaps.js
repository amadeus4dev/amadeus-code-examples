var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Returns all the seat maps of a given flightOffer
amadeus.shopping.flightOffersSearch.get({
  originLocationCode: 'SYD',
  destinationLocationCode: 'BKK',
  departureDate: '2020-08-01',
  adults: '2'
}).then(function (flightOffersSearchResponse) {
  return amadeus.shopping.seatmaps.post(
    JSON.stringify({
      'data': [flightOffersSearchResponse.data[0]]
    })
  );
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});