var Amadeus = require("amadeus");
var amadeus = new Amadeus({
    clientId: 'YOUR_API_KEY',
    clientSecret: 'YOUR_API_SECRET'
});

// finds cities that match a specific word or string of letters. 
// Return a list of cities matching a keyword 'Paris'
amadeus.referenceData.locations.cities.get({
    keyword: 'Paris'
}).catch(function (response) {
    console.error(response);
});
