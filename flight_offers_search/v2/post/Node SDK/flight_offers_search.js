var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Find the cheapest flights from SYD to BKK
amadeus.shopping.flightOffersSearch.post(JSON.stringify({
  "currencyCode": "USD",
  "originDestinations": [{
    "id": "1",
    "originLocationCode": "SYD",
    "destinationLocationCode": "BKK",
    "departureDateTimeRange": {
      "date": "2022-08-01",
      "time": "10:00:00"
    }
  },
  {
    "id": "2",
    "originLocationCode": "BKK",
    "destinationLocationCode": "SYD",
    "departureDateTimeRange": {
      "date": "2022-08-05",
      "time": "17:00:00"
    }
  }
  ],
  "travelers": [{
    "id": "1",
    "travelerType": "ADULT",
    "fareOptions": [
      "STANDARD"
    ]
  },
  {
    "id": "2",
    "travelerType": "CHILD",
    "fareOptions": [
      "STANDARD"
    ]
  }
  ],
  "sources": [
    "GDS"
  ],
  "searchCriteria": {
    "maxFlightOffers": 50,
    "flightFilters": {
      "cabinRestrictions": [{
        "cabin": "BUSINESS",
        "coverage": "MOST_SEGMENTS",
        "originDestinationIds": [
          "1"
        ]
      }],
      "carrierRestrictions": {
        "excludedCarrierCodes": [
          "AA",
          "TP",
          "AZ"
        ]
      }
    }
  }
})).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});