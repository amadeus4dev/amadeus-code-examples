var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Confirm availability and price from SYD to BKK in summer 2020
amadeus.shopping.flightOffersSearch.get({
  originLocationCode: 'SYD',
  destinationLocationCode: 'BKK',
  departureDate: '2020-07-01',
  adults: '1'
}).then(function (flightOffersSearchResponse) {
  return amadeus.shopping.flightOffers.pricing.post(
    JSON.stringify({
      'data': {
        'type': 'flight-offers-pricing',
        'flightOffers': [flightOffersSearchResponse.data[0]]
      }
    })
  )
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});