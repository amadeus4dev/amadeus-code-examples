# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    What are the cities matched with keyword 'Paris' ?
    '''
    response = amadeus.reference_data.locations.cities.get(keyword='Paris')
    print(response.data)
except ResponseError as error:
    raise error
