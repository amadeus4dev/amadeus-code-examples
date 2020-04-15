var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// What is the URL to my online check-in?
amadeus.referenceData.urls.checkinLinks.get({
    airlineCode: 'BA'
  })
  .then(function (response) {
    console.log(response);
  }).catch(function (response) {
    console.error(response);
  });