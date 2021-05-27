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

    // Confirm the availability of a specific offer
    HotelOffer offer = amadeus.shopping.hotelOffer("176383FB301E78D430F81A6CB6134EBF801DCC1AE14FC9DCCE84D17C6B519F5B").get();

    if (offer[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + offer[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(offer[0]);
  }
}
