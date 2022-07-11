const Amadeus = require('amadeus');

var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});
// Or `var amadeus = new Amadeus()` if the environment variables are set


// Hotel name autocomplete for keyword 'PARI' using  HOTEL_GDS category of search
amadeus.referenceData.locations.hotel.get({
  keyword: 'PARI',
  subType: 'HOTEL_GDS'
}).then(response => console.log(response))
  .catch(err => console.error(err));
