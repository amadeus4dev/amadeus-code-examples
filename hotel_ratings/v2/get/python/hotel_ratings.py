# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    What travelers think about this hotel?
    '''
    response = amadeus.e_reputation.hotel_sentiments.get(hotelIds = 'ADNYCCTB')
    print(response.data)
except ResponseError as error:
    raise error
