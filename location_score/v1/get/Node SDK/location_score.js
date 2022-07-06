var Amadeus = require('amadeus');
var amadeus = new Amadeus();

//What are the location scores for the given coordinates?
amadeus.location.analytics.categoryRatedAreas.get({
  latitude: 41.397158,
  longitude: 2.160873
}).then(data => {
  console.log(data.body)
}).catch(error => {
  console.error(error)
});

