import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOfferSearch;

public class FlightOffersSearch {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    FlightOfferSearch[] flightOffersSearches = amadeus.shopping.flightOffersSearch.get(
                  Params.with("originLocationCode", "SYD")
                          .and("destinationLocationCode", "BKK")
                          .and("departureDate", "2020-11-01")
                          .and("returnDate", "2020-11-08")
                          .and("adults", 2)
                          .and("max", 3));

    if (flightOffersSearches[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + flightOffersSearches[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(flightOffersSearches[0]);
  }
}