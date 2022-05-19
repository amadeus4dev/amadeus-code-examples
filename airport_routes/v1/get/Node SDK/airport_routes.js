var Amadeus = require("amadeus");
var amadeus = new Amadeus({
    clientId: 'YOUR_API_KEY',
    clientSecret: 'YOUR_API_SECRET'
});

// Find all destinations served by CDG Airport
amadeus.airport.directDestinations.get({
    departureAirportCode: 'MAD',
}).catch(function (response) {
    console.error(response);
});
