# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Retrieve the seat map of a given flight offer 
    '''
    body = amadeus.shopping.flight_offers_search.get(originLocationCode='MAD',
                                                        destinationLocationCode='NYC',
                                                        departureDate='2020-11-01',
                                                        adults=1,
                                                        max=1).result
    response = amadeus.shopping.seatmaps.post(body)
    print(response.data)
except ResponseError as error:
    raise error
