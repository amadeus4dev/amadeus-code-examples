package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Prediction;

public class TripPurposePrediction {
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

    // Trip Purpose Prediction
    Prediction tripPurpose = amadeus.travel.predictions.tripPurpose.get(Params
        .with("originLocationCode", "NYC")
        .and("destinationLocationCode", "MAD")
        .and("departureDate", "2020-08-01")
        .and("returnDate", "2020-08-12"));
  }
}
