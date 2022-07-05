// How to install the library at https://github.com/amadeus4dev/amadeus-java
import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.ScoredLocation;
import java.util.Arrays;

//Get the score for a given location using its coordinates
public class LocationScore {
    public static void main(String[] args) throws ResponseException {

      Amadeus amadeus = Amadeus
              .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
              .build();

      //Set query parameters
      Params params = Params.with("latitude", 41.397158).and("longitude", 2.160873); 

      //What are the location scores for the given coordinates?
      ScoredLocation[] scoredLocations = amadeus.location.analytics.categoryRatedAreas.get(params);

      if (scoredLocations[0] && scoredLocations[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + scoredLocations[0].getResponse().getStatusCode());
        System.exit(-1);
      }

      Arrays.stream(scoredLocations)
          .map(ScoredLocation::getCategoryScores)
          .forEach(System.out::println);
    }
}
