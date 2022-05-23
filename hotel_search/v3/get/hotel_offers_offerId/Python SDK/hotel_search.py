# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    # Get list of Hotels by city code
    hotels_by_city = amadeus.shopping.hotel_offer_search('63A93695B58821ABB0EC2B33FE9FAB24D72BF34B1BD7D707293763D8D9378FC3').get()
except ResponseError as error:
    raise error