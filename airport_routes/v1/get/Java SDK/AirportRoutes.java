// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Destination;

public class AirportRoutes {

  public static void main(String[] args) throws ResponseException {
    Amadeus amadeus = Amadeus
      .builder("YOUR_AMADEUS_API_KEY", "YOUR_AMADEUS_API_SECRET")
      .build();

    Destination[] directDestinations = amadeus.airport.directDestinations.get(
      Params.with("departureAirportCode", "MAD"));

    if (directDestinations[0].getResponse().getStatusCode() != 200) {
      System.out.println("Wrong status code: " + directDestinations[0].getResponse().getStatusCode());
      System.exit(-1);
    }

    System.out.println(directDestinations[0]);
  }
}