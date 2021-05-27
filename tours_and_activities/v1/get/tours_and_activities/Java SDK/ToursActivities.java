// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Activity;


public class ToursActivities {
    public static void main(String[] args) throws ResponseException {
      Amadeus amadeus = Amadeus
              .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
              .build();

      Activity[] activities = amadeus.shopping.activities.get(Params
        .with("latitude", "41.39715")
        .and("longitude", "2.160873"));

       if(activities[0].getResponse().getStatusCode() != 200) {
               System.out.println("Wrong status code: " + activities[0].getResponse().getStatusCode());
               System.exit(-1);
    }
      System.out.println(activities[0]);
    }
}
