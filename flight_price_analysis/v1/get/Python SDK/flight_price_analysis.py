# Install the Python library from https://pypi.org/project/amadeus
from amadeus import ResponseError, Client

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Returns price metrics of a given itinerary
    '''
    response = amadeus.analytics.itinerary_price_metrics.get(originIataCode='MAD',
                                                             destinationIataCode='CDG',
                                                             departureDate='2022-03-21')
    print(response.data)
except ResponseError as error:
    raise error
