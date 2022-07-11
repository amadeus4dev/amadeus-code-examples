const Amadeus = require('amadeus');

var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});
// Or `var amadeus = new Amadeus()` if the environment variables are set


// What are the destinations served by the British Airways (BA)?
amadeus.airline.destinations.get({airlineCode: 'BA'})
  .then(response => console.log(response))
  .catch(err => console.error(err));
