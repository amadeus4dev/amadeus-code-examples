# Install the Python library from https://pypi.org/project/amadeus
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    body = {
        "originDestinations": [
            {
                "id": "1",
                "originLocationCode": "MIA",
                "destinationLocationCode": "ATL",
                "departureDateTime": {
                    "date": "2021-11-01"
                }
            }
        ],
        "travelers": [
            {
                "id": "1",
                "travelerType": "ADULT"
            }
        ],
        "sources": [
            "GDS"
        ]
    }

    response = amadeus.shopping.availability.flight_availabilities.post(body)
    print(response.data)
except ResponseError as error:
    raise error
