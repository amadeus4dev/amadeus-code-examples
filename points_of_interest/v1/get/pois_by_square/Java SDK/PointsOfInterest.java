// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.PointOfInterest;

public class PointsOfInterest {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    // What are the popular places in Barcelona? (based on a square)
    PointOfInterest[] pointsOfInterest = amadeus.referenceData.locations.pointsOfInterest.bySquare.get(Params
        .with("north", "41.397158")
        .and("west", "2.160873")
        .and("south", "41.394582")
        .and("east", "2.177181"));

    if (pointsOfInterest[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + pointsOfInterest[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(pointsOfInterest[0]);

  }
}