// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Hotel;

public class HotelList {

  public static void main(String[] args) throws ResponseException {
    Amadeus amadeus = Amadeus
      .builder("YOUR_AMADEUS_API_KEY", "YOUR_AMADEUS_API_SECRET")
      .build();

    Hotel[] hotels = amadeus.referenceData.locations.hotels.byCity.get(
      Params.with("cityCode", "PAR"));

    if (hotels[0].getResponse().getStatusCode() != 200) {
      System.out.println("Wrong status code: " + hotels[0].getResponse().getStatusCode());
      System.exit(-1);
    }

    System.out.println(hotels[0]);
  }
}