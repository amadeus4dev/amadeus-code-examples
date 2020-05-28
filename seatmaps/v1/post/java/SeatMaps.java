// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOfferSearch;
import com.amadeus.resources.SeatMap;
import com.google.gson.JsonObject;

public class SeatMaps {
    public static void main(String[] args) throws ResponseException {

      Amadeus amadeus = Amadeus
              .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
              .build();

      FlightOfferSearch[] flightOffers = amadeus.shopping.flightOffersSearch.get(
                    Params.with("originLocationCode", "NYC")
                            .and("destinationLocationCode", "MAD")
                            .and("departureDate", "2020-11-01")
                            .and("returnDate", "2020-11-09")
                            .and("max", "1")
                            .and("adults", 1));

      JsonObject body = flightOffers[0].getResponse().getResult();
      SeatMap[] seatmap = amadeus.shopping.seatMaps.post(body);

      if (seatmap[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + seatmap[0].getResponse().getStatusCode());
        System.exit(-1);
      }

      System.out.println(seatmap[0]);
    }
}
