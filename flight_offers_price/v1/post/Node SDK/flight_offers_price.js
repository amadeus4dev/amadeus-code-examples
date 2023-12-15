var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Confirm availability and price from SYD to BKK in summer 2020
amadeus.shopping.flightOffersSearch.get({
  originLocationCode: 'MAD',
  destinationLocationCode: 'ATH',
  departureDate: '2024-07-01',
  adults: '1'
}).then(function (flightOffersSearchResponse) {
  return amadeus.shopping.flightOffers.pricing.post(
    JSON.stringify({
      'data': {
        'type': 'flight-offers-pricing',
        'flightOffers': [flightOffersSearchResponse.data[0]]
      }
    }), {include: 'credit-card-fees,detailed-fare-rules'} 
  )
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});
