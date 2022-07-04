# Install the Python library from https://pypi.org/project/amadeus
from ast import keyword
from amadeus import Client, ResponseError

amadeus = Client(
)

try:
    '''
    Gets popularity score for location categories
    '''
    response = amadeus.location.analytics.category_rated_areas.get(latitude=41.397158, longitude=2.160873)
    print(response.data)
except ResponseError as error:
    raise error
