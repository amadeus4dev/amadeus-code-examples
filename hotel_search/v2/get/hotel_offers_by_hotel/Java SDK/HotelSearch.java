// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.HotelOffer;

public class HotelSearch {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();

    // Get list of offers for a specific hotel
    HotelOffer hotelOffer = amadeus.shopping.hotelOffersByHotel.get(Params.with("hotelId", "BGMILBGB"));

    if (hotelOffer[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + hotelOffer[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(hotelOffer[0]);
  }
}
