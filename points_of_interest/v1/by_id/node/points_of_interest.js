var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Extract the information about point of interest with ID '9CB40CB5D0'
amadeus.referenceData.locations.pointOfInterest('9CB40CB5D0').get()
  .then(function (response) {
    console.log(response);
  }).catch(function (response) {
    console.error(response);
  });