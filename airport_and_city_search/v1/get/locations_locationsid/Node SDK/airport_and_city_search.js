var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Which cities or airports start with ’r'?
amadeus.referenceData.locations.get({
  keyword: 'r',
  subType: Amadeus.location.any
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});