import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Location;

public class AirportCitySearch {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    // Get a specific city or airport based on its id
    Location location = amadeus.referenceData
      .location("ALHR").get();

    if(location.getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + location.getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(location);
  }
}
