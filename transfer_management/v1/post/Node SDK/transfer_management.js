var Amadeus = require('amadeus');

var amadeus = new Amadeus({
  clientId: 'YOUR_AMADEUS_API_KEY',
  clientSecret: 'YOUR_AMADEUS_API_SECRET'
});

var searchBody =JSON.stringify({
  "startLocationCode": "CDG",
  "endAddressLine": "Avenue Anatole France, 5",
  "endCityName": "Paris",
  "endZipCode": "75007",
  "endCountryCode": "FR",
  "endName": "Souvenirs De La Tour",
  "endGeoCode": "48.859466,2.2976965",
  "transferType": "PRIVATE",
  "startDateTime": "2023-11-10T10:30:00",
  "providerCodes": "TXO",
  "passengers": 2,
  "stopOvers": [
    {
      "duration": "PT2H30M",
      "sequenceNumber": 1,
      "addressLine": "Avenue de la Bourdonnais, 19",
      "countryCode": "FR",
      "cityName": "Paris",
      "zipCode": "75007",
      "name": "De La Tours",
      "geoCode": "48.859477,2.2976985",
      "stateCode": "FR"
    }
  ],
  "startConnectedSegment": {
    "transportationType": "FLIGHT",
    "transportationNumber": "AF380",
    "departure": {
      "localDateTime": "2023-11-10T09:00:00",
      "iataCode": "NCE"
    },
    "arrival": {
      "localDateTime": "2023-11-10T10:00:00",
      "iataCode": "CDG"
    }
  },
  "passengerCharacteristics": [
    {
      "passengerTypeCode": "ADT",
      "age": 20
    },
    {
      "passengerTypeCode": "CHD",
      "age": 10
    }
  ]
})

amadeus.shopping.transferOffers.post(searchBody).then(function (searchResponse) {
  var offerId = searchResponse.data[0].id; // Retrieve offer ID from the response of the first endpoint (Transfer search API)


var offerBody = JSON.stringify({
  "data": {
    "note": "Note to driver",
    "passengers": [
      {
        "firstName": "John",
        "lastName": "Doe",
        "title": "MR",
        "contacts": {
          "phoneNumber": "+33123456789",
          "email": "user@email.com"
        },
        "billingAddress": {
          "line": "Avenue de la Bourdonnais, 19",
          "zip": "75007",
          "countryCode": "FR",
          "cityName": "Paris"
        }
      }
    ],
    "agency": {
      "contacts": [
        {
          "email": {
            "address": "abc@test.com"
          }
        }
      ]
    },
    "payment": {
      "methodOfPayment": "CREDIT_CARD",
      "creditCard": {
        "number": "4111111111111111",
        "holderName": "JOHN DOE",
        "vendorCode": "VI",
        "expiryDate": "0928",
        "cvv": "111"
      }
    },
    "extraServices": [
      {
        "code": "EWT",
        "itemId": "EWT0291"
      }
    ],
    "equipment": [
      {
        "code": "BBS"
      }
    ],
    "corporation": {
      "address": {
        "line": "5 Avenue Anatole France",
        "zip": "75007",
        "countryCode": "FR",
        "cityName": "Paris"
      },
      "info": {
        "AU": "FHOWMD024",
        "CE": "280421GH"
      }
    },
    "startConnectedSegment": {
      "transportationType": "FLIGHT",
      "transportationNumber": "AF380",
      "departure": {
        "uicCode": "7400001",
        "iataCode": "CDG",
        "localDateTime": "2023-03-27T20:03:00"
      },
      "arrival": {
        "uicCode": "7400001",
        "iataCode": "CDG",
        "localDateTime": "2023-03-27T20:03:00"
      }
    },
    "endConnectedSegment": {
      "transportationType": "FLIGHT",
      "transportationNumber": "AF380",
      "departure": {
        "uicCode": "7400001",
        "iataCode": "CDG",
        "localDateTime": "2023-03-27T20:03:00"
      },
      "arrival": {
        "uicCode": "7400001",
        "iataCode": "CDG",
        "localDateTime": "2023-03-27T20:03:00"
      }
    }
  }
})

  amadeus.ordering.transferOrders.post(offerBody, offerId).then(function (orderResponse) {
    var orderId = orderResponse.data.id; // Retrieve order ID from the response of the second endpoint (Transfer Order API)
    var confirmNbr = orderResponse.data.transfers[0].confirmNbr; // Retrieve confirmation number from the response of the second endpoint (Transfer Order API)

    // Transfer Management API to cancel the transfer order.
    amadeus.ordering.transferOrder(orderId).transfers.cancellation.post(JSON.stringify({}), confirmNbr).then(function (response) {
      console.log(response);
    }).catch(function (error3) {
      console.error(error3);
    });
  }).catch(function (error2) {
    console.error(error2);
  });
}).catch(function (error1) {
  console.error(error1);
});
