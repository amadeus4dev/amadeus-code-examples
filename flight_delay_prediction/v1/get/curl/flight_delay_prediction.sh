# Authentication: {API_KEY} & {API_SECRET} must be replaced by your  keys
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id={API_KEY}&client_secret={API_SECRET}"

# {access_token} must be replaced by the value you get from the previous call
curl -X GET "https://test.api.amadeus.com/v1/travel/predictions/flight-delay?originLocationCode=NCE&destinationLocationCode=IST&departureDate=2020-08-01&departureTime=18:20:00&arrivalDate=2020-08-01&arrivalTime=22:15:00&aircraftCode=321&carrierCode=TK&flightNumber=1816&duration=PT31H10M" -H "Authorization: Bearer {access_token}" -k
