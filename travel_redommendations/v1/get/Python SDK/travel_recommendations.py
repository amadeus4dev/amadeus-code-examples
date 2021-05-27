from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Recommends travel destinations similar to Paris for travelers in France
    '''
    response = amadeus.reference_data.recommended_locations.get(cityCodes='PAR', travelerCountryCode='FR')
    print(response.data)
except ResponseError as error:
    raise error