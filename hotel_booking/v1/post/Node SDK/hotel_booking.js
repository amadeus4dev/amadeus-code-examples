var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Book a hotel in PAR for 2023-10-10 to 2023-10-12
amadeus.referenceData.locations.hotels.byCity.get({
  cityCode: 'PAR'
}).then(function (hotels) {
  return amadeus.shopping.hotel_offers_search.get({
    'hotelId': hotels.data[0].hotelId,
    'checkInDate': '2023-10-10',
    'checkOutDate': '2023-10-12'
  });
}).then(function (hotelOffers) {
  return amadeus.shopping.hotelOffer(hotelOffers.data.offers[0].id).get();
}).then(function (pricingResponse) {
  return amadeus.booking.hotelBookings.post(
    JSON.stringify({
      'data': {
        'offerId': pricingResponse.data.offers[0].id,
        'guests': [{
          'id': 1,
          'name': {
            'title': 'MR',
            'firstName': 'BOB',
            'lastName': 'SMITH'
          },
          'contact': {
            'phone': '+33679278416',
            'email': 'bob.smith@email.com'
          }
        }],
        'payments': [{
          'id': 1,
          'method': 'creditCard',
          'card': {
            'vendorCode': 'VI',
            'cardNumber': '4151289722471370',
            'expiryDate': '2022-08'
          }
        }]
      }
    }));
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});