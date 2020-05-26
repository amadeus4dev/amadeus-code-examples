# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Where were people flying to from Madrid in the January 2017?
    '''
    response = amadeus.travel.analytics.air_traffic.traveled.get(originCityCode='MAD', period='2017-01')
    print(response.data)
except ResponseError as error:
    raise error
