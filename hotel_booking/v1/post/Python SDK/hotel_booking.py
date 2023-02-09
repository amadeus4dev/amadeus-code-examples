# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    # Hotel List API to get list of Hotels by city code
    hotels_by_city = amadeus.reference_data.locations.hotels.by_city.get(cityCode='DEL')
    hotelIds = [hotel.get('hotelId') for hotel in hotels_by_city.data[:5]]

    # Hotel Search API to get list of offers for a specific hotel
    hotel_offers = amadeus.shopping.hotel_offers_search.get(
        hotelIds=hotelIds, adults='2', checkInDate='2023-10-01', checkOutDate='2023-10-04')
    offerId = hotel_offers.data[0]['offers'][0]['id']

    guests = [{'id': 1, 'name': {'title': 'MR', 'firstName': 'BOB', 'lastName': 'SMITH'},
               'contact': {'phone': '+33679278416', 'email': 'bob.smith@email.com'}}]
    payments = {'id': 1, 'method': 'creditCard', 'card': {
        'vendorCode': 'VI', 'cardNumber': '4151289722471370', 'expiryDate': '2027-08'}}

    # Hotel booking API to book the offer 
    hotel_booking = amadeus.booking.hotel_bookings.post(
        offerId, guests, payments)
    print(hotel_booking.data)
except ResponseError as error:
    raise error
