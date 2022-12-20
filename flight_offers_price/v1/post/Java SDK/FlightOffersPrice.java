// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOfferSearch;
import com.amadeus.resources.FlightPrice;

public class FlightOffersPrice {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    FlightOfferSearch[] flightOffersSearches = amadeus.shopping.flightOffersSearch.get(
        Params.with("originLocationCode", "SYD")
                .and("destinationLocationCode", "BKK")
                .and("departureDate", "2022-11-01")
                .and("returnDate", "2022-11-08")
                .and("adults", 1)
                .and("max", 2));

    // We price the 2nd flight of the list to confirm the price and the availability
    FlightPrice flightPricing = amadeus.shopping.flightOffersSearch.pricing.post(
            flightOffersSearches[1],
            Params.with("include", "detailed-fare-rules")
              .and("forceClass", "false")
          );

    System.out.println(flightPricing.getResponse());
  }
}