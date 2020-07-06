// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.SafePlace;


public class SafePlace {
    public static void main(String[] args) throws ResponseException {
      Amadeus amadeus = Amadeus
              .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
              .build();

      SafePlace safetyScore = amadeus.safety.safetyRatedLocation("Q930400801").get();

       if(safetyScore.getResponse().getStatusCode() != 200) {
               System.out.println("Wrong status code: " + safetyScore.getResponse().getStatusCode());
               System.exit(-1);
    }
      System.out.println(safetyScore);
    }
}
