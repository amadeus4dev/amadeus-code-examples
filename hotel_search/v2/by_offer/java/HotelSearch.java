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
    HotelOffer offer = amadeus.shopping.hotelOffer("4BA070CE929E135B3268A9F2D0C51E9D4A6CF318BA10485322FA2C7E78C7852E").get();

    if (offer[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + offer[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(offer[0]);
  }
}
