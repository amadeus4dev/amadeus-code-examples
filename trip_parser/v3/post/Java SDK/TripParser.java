// How to install the library at https://github.com/amadeus4dev/amadeus-java
import com.amadeus.Amadeus;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.TripDetail;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.io.IOException;
import java.io.Reader;
import java.nio.file.Files;
import java.nio.file.Paths;

public class TripParser {
    public static void main(String[] args) throws ResponseException {

      Amadeus amadeus = Amadeus
              .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
              .build();

      //Read trip data from file
      Gson gson = new Gson();
      Reader reader = Files.newBufferedReader(Paths.get("../request_body.json"));
      JsonObject body = gson.fromJson(reader, JsonObject.class);  

      TripDetail trip = amadeus.travel.tripParser.post(body);

      if (trip.getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + trip.getResponse().getStatusCode());
        System.exit(-1);
      }

      System.out.println(trip);
    }
}
