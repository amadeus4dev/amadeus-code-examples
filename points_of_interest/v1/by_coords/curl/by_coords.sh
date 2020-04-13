# Authentication: {API_KEY} & {API_SECRET} must be replaced by your  keys

curl -X POST -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id={API_KEY}&client_secret={API_SECRET}"

# {access_token} must be replaced by the value you get from the previous call
# What are the popular places in Barcelona (based a geo location and a radius)
curl -X GET "https://test.api.amadeus.com/v1/reference-data/locations/pois?latitude=41.397158&longitude=2.160873" -H "Authorization: Bearer {access_token}" -k