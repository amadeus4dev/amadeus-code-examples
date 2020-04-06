var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Retrieves the result of the trip parser job
amadeus.travel.tripParserJobs('XXX').result.get()
  .then(function (response) {
    console.log(response);
  }).catch(function (response) {
    console.error(response);
  });