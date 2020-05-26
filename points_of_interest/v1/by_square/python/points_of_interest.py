# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    What are the popular places in Barcelona? (based on a square)
    '''
    response = amadeus.reference_data.locations.points_of_interest.by_square.get(north=41.397158,
                                                                                 west=2.160873,
                                                                                 south=41.394582,
                                                                                 east=2.177181)
    print(response.data)
except ResponseError as error:
    raise error
