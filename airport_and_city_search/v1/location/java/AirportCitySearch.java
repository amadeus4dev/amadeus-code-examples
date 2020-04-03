package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightDate;
import com.amadeus.resources.Location;

public class FlightCheapestDate {
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

    // Airport & City Search (autocomplete)
    // Find all the cities and airports starting by the keyword 'LON'
    Location[] locations = amadeus.referenceData.locations.get(Params
      .with("keyword", "LON")
      .and("subType", Locations.ANY));

    // Get a specific city or airport based on its id
    Location location = amadeus.referenceData
      .location("ALHR").get();

    System.out.println(location);
  }
}
