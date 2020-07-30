var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Recommended locations similar to PAR
amadeus.referenceData.recommendedLocations.get({
    cityCodes: 'PAR',
    travelerCountryCode: 'FR'
}).then(function(response) {
    console.log(response.data);
}).catch((error) => {
    console.log("Error");
    done();
});