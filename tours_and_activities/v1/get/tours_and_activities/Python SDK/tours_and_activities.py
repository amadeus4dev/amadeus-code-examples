# Install the Python library from https://pypi.org/project/amadeus
from amadeus import ResponseError, Client

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Returns activities for a location in Barcelona based on geolocation coordinates
    '''
    response = amadeus.shopping.activities.get(latitude=40.41436995, longitude=-3.69170868)
    print(response.data)
except ResponseError as error:
    raise error
