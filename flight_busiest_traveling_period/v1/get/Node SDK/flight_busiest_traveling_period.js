var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// What were the busiest months for Madrid in 2017?
amadeus.travel.analytics.airTraffic.busiestPeriod.get({
  cityCode: 'MAD',
  period: '2022',
  direction: Amadeus.direction.arriving
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});