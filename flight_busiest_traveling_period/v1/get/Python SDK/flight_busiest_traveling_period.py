# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    What were the busiest months for Madrid in 2022?
    '''
    response = amadeus.travel.analytics.air_traffic.busiest_period.get(
        cityCode='MAD', period='2022', direction='ARRIVING')
    print(response.data)
except ResponseError as error:
    raise error
