package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Location;

public class AirportNearest {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();

    // Airport Nearest Relevant (for London)
    Location[] locations = amadeus.referenceData.locations.airports.get(Params
      .with("latitude", 0.1278)
      .and("longitude", 51.5074));

    System.out.println(flightDestinations);
  }
}
