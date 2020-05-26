# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Give me information about a place based on it's ID
    '''
    response = amadeus.reference_data.locations.point_of_interest('9CB40CB5D0').get()
    print(response.data)
except ResponseError as error:
    raise error
