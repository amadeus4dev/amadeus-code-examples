# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client()

try:
    '''
    Find the cheapest flights from SYD to BKK
    '''
    response = amadeus.shopping.flight_offers_search.get(originLocationCode='SYD', destinationLocationCode='BKK', departureDate='2020-11-01', adults=1)
    # print(response.data)
except ResponseError as error:
    raise error
