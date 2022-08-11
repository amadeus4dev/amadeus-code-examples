var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// What are the Covid19 restrictions for the USA?
amadeus.dutyOfCare.diseases.covid19AreaReport.get({
  countryCode: 'US'
}).then(data => {
  console.log(data.body)
}).catch(error => {
  console.error(error)
});
