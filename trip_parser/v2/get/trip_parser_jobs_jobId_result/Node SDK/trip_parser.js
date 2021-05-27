var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Retrieves the result of the trip parser job
amadeus.travel.tripParserJobs('Mk8RWGGCDagNHOdjP9EZrJ9l').result.get()
  .then(function (response) {
    console.log(response);
  }).catch(function (response) {
    console.error(response);
  });