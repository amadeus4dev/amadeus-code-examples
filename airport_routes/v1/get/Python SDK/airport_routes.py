# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    What are the destinations served by MAD airport?
    '''
    response = amadeus.airport.direct_destinations.get(departureAirportCode='MAD')
    print(response.data)
except ResponseError as error:
    raise error
