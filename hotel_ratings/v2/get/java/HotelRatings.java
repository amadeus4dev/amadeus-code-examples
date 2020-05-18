import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.HotelSentiment;

public class HotelRatings {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();

    // Hotel Ratings / Sentiments
    HotelSentiment[] hotelSentiments = amadeus.ereputation.hotelSentiments.get(Params.with("hotelIds", "ELONMFS,ADNYCCTB"));

    if (hotelSentiments[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + hotelSentiments[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(hotel[0]);
  }
}
