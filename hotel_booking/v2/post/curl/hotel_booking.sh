# Authentication: $AMADEUS_CLIENT_ID & $AMADEUS_CLIENT_SECRET can be defined
# in your environmental variables or directly in your script
ACCESS_TOKEN=$(curl -H "Content-Type: application/x-www-form-urlencoded" \
https://test.api.amadeus.com/v1/security/oauth2/token \
-d "grant_type=client_credentials&client_id=$AMADEUS_CLIENT_ID&client_secret=$AMADEUS_CLIENT_SECRET" \
| grep access_token | sed 's/"access_token": "\(.*\)"\,/\1/' | tr -d '[:space:]')

curl -X POST -H "Authorization: Bearer $ACCESS_TOKEN" \
-H "Content-Type: application/json" \
https://test.api.amadeus.com/v2/booking/hotel-orders \
-d '{
    "data": {
        "type": "hotel-order",
        "guests": [
            {
                "tid": 1,
                "title": "MR",
                "firstName": "BOB",
                "lastName": "SMITH",
                "phone": "+33679278416",
                "email": "bob.smith@email.com"
            }
        ],
        "travelAgent": {
            "contact": {
                "email": "bob.smith@email.com"
            }
        },
        "roomAssociations": [
            {
                "guestReferences": [
                    {
                        "guestReference": "1"
                    }
                ],
                "hotelOfferId": "4BD0MJ3VIP"
            }
        ],
        "payment": {
            "method": "CREDIT_CARD",
            "paymentCard": {
                "paymentCardInfo": {
                    "vendorCode": "VI",
                    "cardNumber": "4151289722471370",
                    "expiryDate": "2026-08",
                    "holderName": "BOB SMITH"
                }
            }
        }
    }
}'