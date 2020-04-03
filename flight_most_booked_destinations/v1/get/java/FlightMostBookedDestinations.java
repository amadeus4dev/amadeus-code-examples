package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.AirTraffic;

public class FlightMostBookedDestinations {
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

    // Flight Most Booked Destinations
    AirTraffic[] airTraffics = amadeus.travel.analytics.airTraffic.booked.get(Params
      .with("originCityCode", "MAD")
      .and("period", "2017-08"));

    System.out.println(flightDestinations);
  }
}

