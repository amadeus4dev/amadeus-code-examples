# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    What are the Covid19 restrictions for the USA?
    '''
    response = amadeus.duty_of_care.diseases.covid19_report.get(countryCode='US')
    print(response.data)
except ResponseError as error:
    raise error
