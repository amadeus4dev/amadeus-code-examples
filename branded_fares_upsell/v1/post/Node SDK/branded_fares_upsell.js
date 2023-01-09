var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_AMADEUS_API_KEY',
  clientSecret: 'YOUR_AMADEUS_API_SECRET'
});


// Search flights from LON to DEL
amadeus.shopping.flightOffersSearch.get({
  originLocationCode: 'LON',
  destinationLocationCode: 'DEL',
  departureDate: '2023-06-01',
  returnDate: '2023-06-30',
  adults: '1'
//then Get branded fares available from the first offer
}).then(function (flightOffersResponse) {
  return amadeus.shopping.flightOffers.upselling.post(
    JSON.stringify({
      "data": {
        "type": "flight-offers-upselling",
        "flightOffers": [
          flightOffersResponse.data[0]
        ],
        "payments": [
          {
            "brand": "VISA_IXARIS",
            "binNumber": 123456,
            "flightOfferIds": [
              1
            ]
          }
        ]
      }
    })
  );
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});