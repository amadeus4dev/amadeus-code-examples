package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.PointOfInterest;

public class PointsOfInterest {
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

    // Points of Interest
    // What are the popular places in Barcelona (based a geo location and a radius)
    PointOfInterest[] pointsOfInterest = amadeus.referenceData.locations.pointsOfInterest.get(Params
       .with("latitude", "41.39715")
       .and("longitude", "2.160873"));

    // What are the popular places in Barcelona? (based on a square)
    PointOfInterest[] pointsOfInterest = amadeus.referenceData.locations.pointsOfInterest.bySquare.get(Params
        .with("north", "41.397158")
        .and("west", "2.160873")
        .and("south", "41.394582")
        .and("east", "2.177181"));

    // Returns a single Point of Interest from a given id
    PointOfInterest pointOfInterest = amadeus.referenceData.locations.pointOfInterest("9CB40CB5D0").get();
  }
}