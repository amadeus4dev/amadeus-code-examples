# Install the Python library from https://pypi.org/project/amadeus
from amadeus import ResponseError, Client

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Get list of hotels by a geocode
    '''
    response = amadeus.reference_data.locations.hotels.by_geocode.get(longitude=2.160873,latitude=41.397158)

    print(response.data)
except ResponseError as error:
    raise error