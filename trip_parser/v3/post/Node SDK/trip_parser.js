var Amadeus = require("amadeus");
var amadeus = new Amadeus({
  clientId: 'YOUR_API_KEY',
  clientSecret: 'YOUR_API_SECRET'
});

//Read trip data from file
const body = require('../request_body.json');
amadeus.travel.tripParser.post(JSON.stringify(body))
  .then(response => console.log(response))
  .catch(err => console.error(err));

/**
 * If you don't have your base64 encoded payload, you can use
 * the SDK helper method to create your request body
 * '''js
 * const base64Payload = amadeus.tripParser.fromFile(fileInUTF8Format)
 * '''
 */