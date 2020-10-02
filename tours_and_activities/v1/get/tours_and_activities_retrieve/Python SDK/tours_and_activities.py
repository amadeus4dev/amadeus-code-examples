# Install the Python library from https://pypi.org/project/amadeus
from amadeus import ResponseError, Client

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Returns information of an activity from a given Id
    '''
    response = amadeus.shopping.activity('3216547684').get()
    print(response.data)
except ResponseError as error:
    raise error
