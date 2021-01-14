// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.booking.FlightOrder;
import com.amadeus.exceptions.ResponseException;

public class FlightOrderManagement {
    public static void main(String[] args) {
      Amadeus amadeus = Amadeus
              .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
              .build();
      try {
        com.amadeus.resources.FlightOrder order = amadeus.booking.flightOrder("eJzTd9cP8A8y8nIDAAtUAlk%3D").delete();
      } catch (ResponseException e) {
        if (!e.getMessage().equals("[204]")) {
            System.out.println("Wrong status code: " + e.getMessage());
            System.exit(-1);
        }
        System.out.println("Flight order successfully deleted");
      }
    }
}
