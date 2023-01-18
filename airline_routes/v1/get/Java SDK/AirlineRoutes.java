
// How to install the library at https://github.com/amadeus4dev/amadeus-java
import com.amadeus.Amadeus;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Destination;

// What are the destinations served by the British Airways (BA)?
public class AirlineRoutes {
  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY", "YOUR_AMADEUS_API_SECRET")
        .build();

    // Set query parameters
    Params params = Params
        .with("airlineCode", "BA");

    // Run the query
    Destination[] destinations = amadeus.airline.destinations.get(params);

    if (destinations[0].getResponse().getStatusCode() != 200) {
      System.out.println("Wrong status code: " + destinations[0].getResponse().getStatusCode());
      System.exit(-1);
    }

    System.out.println(destinations[0]);
  }
}
