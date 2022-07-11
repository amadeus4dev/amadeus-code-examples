import json
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
  with open('../request_body.json') as file:
    body = json.load(file)
    response = amadeus.travel.trip_parser.post(body)
    print(response.data)
except ResponseError as error:
    raise error
