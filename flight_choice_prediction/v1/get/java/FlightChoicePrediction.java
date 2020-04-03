package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOfferSearch;

public class FlightChoicePrediction {
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

    FlightOffer[] flightOffers = amadeus.shopping.flightOffers
            .get(Params.with("origin", "MAD").and("destination", "NYC").and("departureDate", "2020-08-01").and("max", "2"));

    // Using a JSonObject
    JsonObject result = flightOffers[0].getResponse().getResult();
    FlightOffer[] flightOffersPrediction = amadeus.shopping.flightOffers.prediction.post(result);

    // Using a String
    String body = flightOffers[0].getResponse().getBody();
    FlightOffer[] flightOffersPrediction = amadeus.shopping.flightOffers.prediction.post(body);

    System.out.println(flightOffers[0]);
  }
}