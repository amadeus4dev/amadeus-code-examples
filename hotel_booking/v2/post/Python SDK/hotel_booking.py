# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    # Hotel List API to get list of Hotels by city code
    hotels_by_city = amadeus.reference_data.locations.hotels.by_city.get(cityCode='BLR')
    hotelIds = [hotel.get('hotelId') for hotel in hotels_by_city.data[:5]]

    # Hotel Search API to get list of offers for a specific hotel
    hotel_offers = amadeus.shopping.hotel_offers_search.get(
        hotelIds=hotelIds, adults='1', checkInDate='2024-10-01', checkOutDate='2024-10-04')
    offerId = hotel_offers.data[0]['offers'][0]['id']

    guests = [
            {
                "tid": 1,
                "title": "MR",
                "firstName": "BOB",
                "lastName": "SMITH",
                "phone": "+33679278416",
                "email": "bob.smith@email.com"
            }
        ]
    travel_agent = {
            "contact": {
                "email": "bob.smith@email.com"
            }
        }
    room_associations = [
            {
                "guestReferences": [
                    {
                        "guestReference": "1"
                    }
                ],
                "hotelOfferId": offerId
            }
        ]
    payment = {
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
    # Hotel booking API v2 to book the offer 
    hotel_booking = amadeus.booking.hotel_orders.post(
        guests=guests, 
        travel_agent=travel_agent,
        room_associations=room_associations,
        payment=payment)
    print(hotel_booking.data)
except ResponseError as error:
    raise error