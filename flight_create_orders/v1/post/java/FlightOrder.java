package flightsearch;
import java.util.logging.Logger;

import com.amadeus.booking.FlightOrder;
import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;

public class FlightOrder {
  private final static Logger LOGGER = Logger.getLogger(FlightSearch.class.getName());
    public static void main(String[] args) throws ResponseException {

      Amadeus amadeus = Amadeus
              .builder("","")
              .setLogger(LOGGER)
              .build();
      
      com.amadeus.resources.FlightOrder fo = amadeus.booking.flightOrder("eJzTd9f3NjIJdzUGAAp%2fAiY=").get();

      System.out.println(fo);
      FlightOrder order = amadeus.booking.flightOrder("eJzTd9f3NjIJdzUGAAp%2fAiY=").delete();
      }
}
