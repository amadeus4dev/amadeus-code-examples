# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client()

try:
    # Get list of Hotels by city code
    hotels_by_city = amadeus.shopping.hotel_offers.get(cityCode='LON')
    print(hotels_by_city.data)
except ResponseError as error:
    raise error
