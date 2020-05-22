# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client()

try:
    '''
    What are the popular places in Barcelona (based a geo location and a radius)
    '''
    response = amadeus.reference_data.locations.points_of_interest.get(latitude=41.397158, longitude=2.160873)
    print(response.data)
except ResponseError as error:
    raise error

try:
    '''
    Give me information about a place based on it's ID
    '''
    response = amadeus.reference_data.locations.point_of_interest('9CB40CB5D0').get()
    print(response.data)
except ResponseError as error:
    raise error
