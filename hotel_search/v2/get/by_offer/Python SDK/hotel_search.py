# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    # Confirm the availability of a specific offer
    offer_availability = amadeus.shopping.hotel_offer('F5B20A8E3C7EED38BDB931B587B3435232A8C804E3271D96F9B5826C326F61FA').get()
    print(offer_availability.data)
except ResponseError as error:
    raise error
