var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Retrieves a Parser Job by its Id
amadeus.travel.tripParserJobs('JKKSJNMSKHJ').get()
  .then(function (response) {
    console.log(response);
  }).catch(function (response) {
    console.error(response);
  });