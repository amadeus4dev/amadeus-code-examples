# Install the Python library from https://pypi.org/project/amadeus
from amadeus import ResponseError, Client

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Returns safety information for a location in Barcelona based a geolocation coordinates
    '''
    response = amadeus.safety.safety_rated_locations.get(latitude=41.397158, longitude=2.160873)
    print(response.data)
except ResponseError as error:
    raise error
