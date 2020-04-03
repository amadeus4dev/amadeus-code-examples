package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOfferSearch;

public class FlightOffersSearch {
  /**
   * <p>
   *   An example to call the AI-Generated Photos API
   *   <code>/v2/media/files/generated-photos</code> endpoints.
   * </p>
   *
   * <p>
   *   Access via the Amadeus client object.
   * </p>
   *
   * <pre>
   * Amadeus amadeus = Amadeus.builder("clientId", "secret").build();
   * amadeus.media.files.generatedPhotos;</pre>
   */
  public static void main(String[] args) throws ResponseException {


    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();
    FlightOfferSearch[] flightOffersSearches = amadeus.shopping.flightOffersSearch.get(
                  Params.with("originLocationCode", "SYD")
                          .and("destinationLocationCode", "BKK")
                          .and("departureDate", "2020-11-01")
                          .and("returnDate", "2020-11-08")
                          .and("adults", 2)
                          .and("max", 3));

    System.out.println(flightOffersSearches);
  }
}