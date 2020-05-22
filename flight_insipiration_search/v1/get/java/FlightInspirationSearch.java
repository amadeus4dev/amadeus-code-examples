import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightDestination;

public class FlightInspirationSearch {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    FlightDestination[] flightDestinations = amadeus.shopping.flightDestinations.get(Params
    .with("origin", "MAD"));

    if (flightDestinations[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + flightDestinations[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(flightDestinations[0]);
  }
}