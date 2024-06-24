var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Book a hotel in BLR for 2024-10-10 to 2024-10-12 for 1 guest
// 1. Hotel List API to get the list of hotels 
amadeus.referenceData.locations.hotels.byCity.get({
  cityCode: 'BLR'
}).then(function (hotelsList) {
// 2. Hotel Search API to get the price and offer id
  return amadeus.shopping.hotelOffersSearch.get({
    'hotelIds': hotelsList.data[0].hotelId,
    'adults' : 1,
    'checkInDate': '2024-10-10',
    'checkOutDate': '2024-10-12'
  });
}).then(function (pricingResponse) {
// Finally, Hotel Booking API to book the offer
  return amadeus.booking.hotelOrders.post(
    JSON.stringify({
      "data": {
          "type": "hotel-order",
          "guests": [
              {
                  "tid": 1,
                  "title": "MR",
                  "firstName": "BOB",
                  "lastName": "SMITH",
                  "phone": "+33679278416",
                  "email": "bob.smith@email.com"
              }
          ],
          "travelAgent": {
              "contact": {
                  "email": "bob.smith@email.com"
              }
          },
          "roomAssociations": [
              {
                  "guestReferences": [
                      {
                          "guestReference": "1"
                      }
                  ],
                  "hotelOfferId": pricingResponse.data[0].offers[0].id
              }
          ],
          "payment": {
              "method": "CREDIT_CARD",
              "paymentCard": {
                  "paymentCardInfo": {
                      "vendorCode": "VI",
                      "cardNumber": "4151289722471370",
                      "expiryDate": "2026-08",
                      "holderName": "BOB SMITH"
                  }
              }
          }
      }
  }));
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});