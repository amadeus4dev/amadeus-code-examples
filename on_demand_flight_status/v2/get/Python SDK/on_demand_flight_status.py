from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    '''
    Returns flight status of a given flight
    '''
    response = amadeus.schedule.flights.get(carrierCode='AZ',
                                            flightNumber='319',
                                            scheduledDepartureDate='2022-03-13')
    print(response.data)
except ResponseError as error:
    raise error
