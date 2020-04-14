# Authentication: {API_KEY} & {API_SECRET} must be replaced by your  keys
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id={API_KEY}&client_secret={API_SECRET}"

# {access_token} must be replaced by the value you get from the previous call
curl -X GET "https://test.api.amadeus.com/v2/media/files/generated-photos?category=MOUNTAIN" -H "Authorization: Bearer {access_token}" -k