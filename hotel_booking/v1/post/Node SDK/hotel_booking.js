var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Book a hotel in DEL for 2023-10-10 to 2023-10-12 
// 1. Hotel List API to get the list of hotels 
amadeus.referenceData.locations.hotels.byCity.get({
  cityCode: 'LON'
}).then(function (hotelsList) {
// 2. Hotel Search API to get the price and offer id
  return amadeus.shopping.hotelOffersSearch.get({
    'hotelIds': hotelsList.data[0].hotelId,
    'adults' : 1,
    'checkInDate': '2023-10-10',
    'checkOutDate': '2023-10-12'
  });
}).then(function (pricingResponse) {
// Finally, Hotel Booking API to book the offer
  return amadeus.booking.hotelBookings.post(
    JSON.stringify({
      'data': {
        'offerId': pricingResponse.data[0].offers[0].id,
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