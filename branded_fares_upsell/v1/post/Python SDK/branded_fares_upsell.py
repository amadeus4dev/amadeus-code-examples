# Install the Python library from https://pypi.org/project/amadeus
import json
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

try:
    json_string = '{ "data": { "type": "flight-offers-upselling", "flightOffers": [ { "type": "flight-offer", ' \
                  '"id": "1", ' \
                  '"source": "GDS", "instantTicketingRequired": false, "nonHomogeneous": false, "oneWay": false, ' \
                  '"lastTicketingDate": "2022-05-11", "numberOfBookableSeats": 9, "itineraries": [ { "duration": ' \
                  '"PT2H10M", ' \
                  '"segments": [ { "departure": { "iataCode": "CDG", "terminal": "3", "at": "2022-07-04T20:45:00" }, ' \
                  '"arrival": { ' \
                  '"iataCode": "MAD", "terminal": "4", "at": "2022-07-04T22:55:00" }, "carrierCode": "IB", ' \
                  '"number": "3741", ' \
                  '"aircraft": { "code": "32A" }, "operating": { "carrierCode": "I2" }, "duration": "PT2H10M", ' \
                  '"id": "4", ' \
                  '"numberOfStops": 0, "blacklistedInEU": false } ] } ], "price": { "currency": "EUR", ' \
                  '"total": "123.02", ' \
                  '"base": "92.00", "fees": [ { "amount": "0.00", "type": "SUPPLIER" }, { "amount": "0.00", ' \
                  '"type": "TICKETING" } ' \
                  '], "grandTotal": "123.02", "additionalServices": [ { "amount": "30.00", "type": "CHECKED_BAGS" } ] ' \
                  '}, ' \
                  '"pricingOptions": { "fareType": [ "PUBLISHED" ], "includedCheckedBagsOnly": false }, ' \
                  '"validatingAirlineCodes": [ ' \
                  '"IB" ], "travelerPricings": [ { "travelerId": "1", "fareOption": "STANDARD", "travelerType": ' \
                  '"ADULT", ' \
                  '"price": { "currency": "EUR", "total": "123.02", "base": "92.00" }, "fareDetailsBySegment": [ { ' \
                  '"segmentId": ' \
                  '"4", "cabin": "ECONOMY", "fareBasis": "SDNNEOB2", "brandedFare": "NOBAG", "class": "S", ' \
                  '"includedCheckedBags": { ' \
                  '"quantity": 0 } } ] } ] } ], "payments": [ { "brand": "VISA_IXARIS", "binNumber": 123456, ' \
                  '"flightOfferIds": [ 1 ' \
                  '] } ] } } '

    body = json.loads(json_string)
    response = amadeus.shopping.flight_offers.upselling.post(body)
    print(response.data)
except ResponseError as error:
    raise error
