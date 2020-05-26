# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

traveler = {
  'id': '1',
  'dateOfBirth': '1982-01-16',
  'name': {
    'firstName': 'JORGE',
    'lastName': 'GONZALES'
  },
  'gender': 'MALE',
  'contact': {
    'emailAddress': 'jorge.gonzales833@telefonica.es',
    'phones': [{
      'deviceType': 'MOBILE',
      'countryCallingCode': '34',
      'number': '480080076'
    }]
  },
  'documents': [{
    'documentType': 'PASSPORT',
    'birthPlace': 'Madrid',
    'issuanceLocation': 'Madrid',
    'issuanceDate': '2015-04-14',
    'number': '00000000',
    'expiryDate': '2025-04-14',
    'issuanceCountry': 'ES',
    'validityCountry': 'ES',
    'nationality': 'ES',
    'holder': True
  }]
}

try:
    # Flight Offers Search to search for flights from MAD to ATH
    flight_search = amadeus.shopping.flight_offers_search.get(originLocationCode='MAD',
                                                              destinationLocationCode='ATH',
                                                              departureDate='2020-12-01',
                                                              adults=1).data

    # Flight Offers Price to confirm the price of the chosen flight
    price_confirm = amadeus.shopping.flight_offers.pricing.post(flight_search[0]).data

    # Flight Create Orders to book the flight
    booked_flight = amadeus.booking.flight_orders.post(flight_search[0], traveler).data

except ResponseError as error:
    raise error
