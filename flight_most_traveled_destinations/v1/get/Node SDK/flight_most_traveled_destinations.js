var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Where were people flying to from Madrid in the January 2017?
amadeus.travel.analytics.airTraffic.traveled.get({
  originCityCode: 'MAD',
  period: '2017-01'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});