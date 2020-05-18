import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.HotelOffer;

public class HotelSearch {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();

    // Get list of hotels by city code
    HotelOffer[] offers = amadeus.shopping.hotelOffers.get(Params
      .with("cityCode", "MAD"));
    if (offers[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + offers[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(offers[0]);
  }
}
