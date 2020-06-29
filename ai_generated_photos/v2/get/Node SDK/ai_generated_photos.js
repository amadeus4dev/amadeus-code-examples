var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

// Generates a photo with mountain
amadeus.media.files.generatedPhotos.get({
  category: 'MOUNTAIN'
}).then(function (response) {
  console.log(response);
}).catch(function (response) {
  console.error(response);
});