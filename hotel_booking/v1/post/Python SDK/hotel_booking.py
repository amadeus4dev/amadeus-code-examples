# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    # Get list of Hotels by city code
    hotels_by_city = amadeus.shopping.hotel_offers.get(cityCode='LON')

    # Get list of offers for a specific hotel
    hotel_offers = amadeus.shopping.hotel_offers_by_hotel.get(
        hotelId='HSMADAMI', checkInDate='2022-02-01', checkOutDate='2022-01-02')

    # Confirm the availability of a specific offer
    offer = hotel_offers.data['offers'][0]['id']
    offer_availability = amadeus.shopping.hotel_offer(offer).get()

    guests = [{'id': 1, 'name': {'title': 'MR', 'firstName': 'BOB', 'lastName': 'SMITH'},
               'contact': {'phone': '+33679278416', 'email': 'bob.smith@email.com'}}]
    payments = {'id': 1, 'method': 'creditCard', 'card': {
        'vendorCode': 'VI', 'cardNumber': '4151289722471370', 'expiryDate': '2021-08'}}

    hotel_booking = amadeus.booking.hotel_bookings.post(
        offer, guests, payments)
    print(hotel_booking.data)
except ResponseError as error:
    raise error
