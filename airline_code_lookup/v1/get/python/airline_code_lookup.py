# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    What's the airline name for the IATA code BA?
    '''
    response = amadeus.reference_data.airlines.get(airlineCodes='BA')
    print(response.data)
except ResponseError as error:
    raise error
