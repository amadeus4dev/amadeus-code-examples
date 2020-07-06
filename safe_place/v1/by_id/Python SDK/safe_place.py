# Install the Python library from https://pypi.org/project/amadeus
from amadeus import ResponseError, Client

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Returns safety information in Barcelona within a designated area
    '''
    response = amadeus.safety.safety_rated_location('Q930400801').get()
    print(response.data)
except ResponseError as error:
    raise error
