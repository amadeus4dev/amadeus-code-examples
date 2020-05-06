package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightPrice;

public class FlightOffersPrice {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();

    FlightPrice[] flightPricing = amadeus.shopping.flightOffersSearch.pricing.post(
                        body,
                        Params.with("include", "other-services")
                              .and("forceClass", "false"));

    System.out.println(flightOffersSearches);
  }
}