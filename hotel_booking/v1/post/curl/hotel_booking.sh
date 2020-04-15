# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

curl -X POST -H "Authorization: Bearer $ACCESS_TOKEN" \
-H "Content-Type: application/json" \
https://test.api.amadeus.com/v1/booking/hotel-bookings \
-d '{
  "data": {
    "offerId": "FBBA8AF0721F59AA19C68FDA7FEBEA8AD6B781236BD7DCB8009325FBAE96006B",
    "guests": [
      {
        "id": 1,
        "name": {
          "title": "MR",
          "firstName": "BOB",
          "lastName": "SMITH"
        },
        "contact": {
          "phone": "+33679278416",
          "email": "bob.smith@email.com"
        }
      }
    ],
    "payments": [
      {
        "id": 1,
        "method": "creditCard",
        "card": {
          "vendorCode": "VI",
          "cardNumber": "4151289722471370",
          "expiryDate": "2021-08"
        }
      }
    ],
    "rooms": [
      {
        "guestIds": [
          1
        ],
        "paymentId": 1,
        "specialRequest": "I will arrive at midnight"
      }
    ]
  }
}'