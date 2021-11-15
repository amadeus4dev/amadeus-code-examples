import json
from amadeus import Client, ResponseError

amadeus = Client(
    client_id='YOUR_AMADEUS_API_KEY',
    client_secret='YOUR_AMADEUS_API_SECRET'
)

json_string = '{ "currencyCode": "ZAR", "originDestinations": [ { "id": "1", "originLocationCode": "JNB", ' \
              '"destinationLocationCode": "CPT", "departureDateTimeRange": { "date": "2022-07-01", "time": "00:00:00" ' \
              '} }, { "id": "2", "originLocationCode": "CPT", "destinationLocationCode": "JNB", ' \
              '"departureDateTimeRange": { "date": "2022-07-29", "time": "00:00:00" } } ], "travelers": [ { "id": ' \
              '"1", "travelerType": "ADULT" }, { "id": "2", "travelerType": "ADULT" }, { "id": "3", "travelerType": ' \
              '"HELD_INFANT", "associatedAdultId": "1" } ], "sources": [ "GDS" ], "searchCriteria": { ' \
              '"excludeAllotments": true, "addOneWayOffers": false, "maxFlightOffers": 10, ' \
              '"allowAlternativeFareOptions": true, "oneFlightOfferPerDay": true, "additionalInformation": { ' \
              '"chargeableCheckedBags": true, "brandedFares": true, "fareRules": false }, "pricingOptions": { ' \
              '"includedCheckedBagsOnly": false }, "flightFilters": { "crossBorderAllowed": true, ' \
              '"moreOvernightsAllowed": true, "returnToDepartureAirport": true, "railSegmentAllowed": true, ' \
              '"busSegmentAllowed": true, "carrierRestrictions": { "blacklistedInEUAllowed": true, ' \
              '"includedCarrierCodes": [ "FA" ] }, "cabinRestrictions": [ { "cabin": "ECONOMY", "coverage": ' \
              '"MOST_SEGMENTS", "originDestinationIds": [ "2" ] }, { "cabin": "ECONOMY", "coverage": "MOST_SEGMENTS", ' \
              '"originDestinationIds": [ "1" ] } ], "connectionRestriction": { "airportChangeAllowed": true, ' \
              '"technicalStopsAllowed": true } } } }'

body = json.loads(json_string)
try:
    response = amadeus.shopping.flight_offers_search.post(body)
    print(response.data)
except ResponseError as error:
    raise error
