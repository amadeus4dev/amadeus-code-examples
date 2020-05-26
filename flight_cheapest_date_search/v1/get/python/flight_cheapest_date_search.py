# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Find cheapest dates from Madrid to London
    '''
    response = amadeus.shopping.flight_dates.get(origin='MAD', destination='LON')
    print(response.data)
except ResponseError as error:
    raise error
