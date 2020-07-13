var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_KEY'
});

// Retrieve information about the LHR airport?
amadeus.referenceData.location('ALHR').get()
  .then(function (response) {
    console.log(response);
  }).catch(function (response) {
    console.error(response);
  });