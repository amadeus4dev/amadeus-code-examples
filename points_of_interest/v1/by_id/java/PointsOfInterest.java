// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.PointOfInterest;

public class PointsOfInterest {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = AAmadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    // Returns a single Point of Interest from a given id
    PointOfInterest pointOfInterest = amadeus.referenceData.locations.pointOfInterest("9CB40CB5D0").get();

   if (pointsOfInterest[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + pointsOfInterest[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(pointsOfInterest[0]);
  }
}