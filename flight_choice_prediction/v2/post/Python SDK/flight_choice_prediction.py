# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Find the probability of the flight MAD to NYC to be chosen
    '''
    body = amadeus.shopping.flight_offers_search.get(originLocationCode='MAD',
                                                        destinationLocationCode='NYC',
                                                        departureDate='2020-11-01',
                                                        returnDate='2020-11-09',
                                                        adults=1).result
    response = amadeus.shopping.flight_offers.prediction.post(body)
    print(response.data)
except ResponseError as error:
    raise error
