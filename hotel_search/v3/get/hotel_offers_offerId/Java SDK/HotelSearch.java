// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.HotelOfferSearch;

public class HotelSearch {

  public static void main(String[] args) throws ResponseException {
    Amadeus amadeus = Amadeus
      .builder("YOUR_AMADEUS_API_KEY", "YOUR_AMADEUS_API_SECRET")
      .build();

    HotelOfferSearch offer = amadeus.shopping.hotelOfferSearch(
        "0W7UU1NT9B")
      .get();

    if (offer.getResponse().getStatusCode() != 200) {
      System.out.println("Wrong status code: " + offer.getResponse().getStatusCode());
      System.exit(-1);
    }

    System.out.println(offer);
  }
}