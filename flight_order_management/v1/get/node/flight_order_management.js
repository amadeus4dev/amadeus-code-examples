var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Book a flight from MAD to ATH on 2020-08-01 and then retrieve it
amadeus.shopping.flightOffersSearch.get({
  originLocationCode: 'MAD',
  destinationLocationCode: 'ATH',
  departureDate: '2020-08-01',
  adults: '1'
}).then(function (flightOffersResponse) {
  return amadeus.shopping.flightOffers.pricing.post(
    JSON.stringify({
      "data": {
        "type": "flight-offers-pricing",
        "flightOffers": [
          flightOffersResponse.data[0]
        ]
      }
    })
  );
}).then(function (pricingResponse) {
  return amadeus.booking.flightOrders.post(
    JSON.stringify({
      'data': {
        'type': 'flight-order',
        'flightOffers': [pricingResponse.data.flightOffers[0]],
        'travelers': [{
          "id": "1",
          "dateOfBirth": "1982-01-16",
          "name": {
            "firstName": "JORGE",
            "lastName": "GONZALES"
          },
          "gender": "MALE",
          "contact": {
            "emailAddress": "jorge.gonzales833@telefonica.es",
            "phones": [{
              "deviceType": "MOBILE",
              "countryCallingCode": "34",
              "number": "480080076"
            }]
          },
          "documents": [{
            "documentType": "PASSPORT",
            "birthPlace": "Madrid",
            "issuanceLocation": "Madrid",
            "issuanceDate": "2015-04-14",
            "number": "00000000",
            "expiryDate": "2025-04-14",
            "issuanceCountry": "ES",
            "validityCountry": "ES",
            "nationality": "ES",
            "holder": true
          }]
        }]
      }
    })
  );
}).then(function (bookingResponse) {
  return amadeus.booking.flightOrder(bookingResponse.data.id).get()
}).then(function (response) {
  console.log(response.data);
}).catch(function (responseError) {
  console.error(responseError);
});