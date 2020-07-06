# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Retrieve the seat map of a flight present in an order
    '''
    response = amadeus.shopping.seatmaps.get(flightorderId='eJzTd9cPDPMwcooAAAtXAmE=')
    print(response.data)
except ResponseError as error:
    raise error
