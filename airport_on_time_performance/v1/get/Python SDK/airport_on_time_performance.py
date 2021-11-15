# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Will there be a delay in the JFK airport on the 1st of December?
    '''
    response = amadeus.airport.predictions.on_time.get(
        airportCode='JFK', date='2021-12-01')
    print(response.data)
except ResponseError as error:
    raise error
