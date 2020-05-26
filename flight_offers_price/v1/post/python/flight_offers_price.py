# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Confirm availability and price from SYD to BKK in summer 2020
    '''
    flights = amadeus.shopping.flight_offers_search.get(originLocationCode='SYD', destinationLocationCode='BKK',
                                                        departureDate='2020-07-01', adults=1).data
    response_one_flight = amadeus.shopping.flight_offers.pricing.post(flights[0])
    print(response_one_flight.data)

    response_two_flights = amadeus.shopping.flight_offers.pricing.post(flights[0:2])
    print(response_two_flights.data)
except ResponseError as error:
    raise error
