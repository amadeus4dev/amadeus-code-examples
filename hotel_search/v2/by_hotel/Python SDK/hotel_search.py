# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    # Get list of offers for a specific hotel
    hotel_offers = amadeus.shopping.hotel_offers_by_hotel.get(hotelId = 'HSMADAMI')
    # print(hotel_offers.data)
except ResponseError as error:
    raise error
