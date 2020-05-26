// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.SeatMap;

public class SeatMaps {
    public static void main(String[] args) throws ResponseException {

      Amadeus amadeus = Amadeus
              .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
              .build();
      
      SeatMap[] seatmap = amadeus.shopping.seatMaps.get(Params
      .with("flight-orderId", "eJzTd9f3NjIJdzUGAAp%2fAiY="));

      if (seatmap[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + seatmap[0].getResponse().getStatusCode());
        System.exit(-1);
      }

      System.out.println(seatmap[0]);
    }
}




