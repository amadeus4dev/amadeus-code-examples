
// How to install the library at https://github.com/amadeus4dev/amadeus-java
import com.amadeus.Amadeus;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.TripDetail;

// Hotel name autocomplete for keyword 'PARI' using  HOTEL_GDS category of search
public class HotelNameAutocomplete {
  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY", "YOUR_AMADEUS_API_SECRET")
        .build();

    // Set query parameters
    Params params = Params
        .with("keyword", "PARI")
        .and("subType", "HOTEL_GDS");

    // Run the query
    Hotel[] hotels = amadeus.referenceData.locations.hotel.get(params);

    if (hotels.getResponse().getStatusCode() != 200) {
      System.out.println("Wrong status code: " + hotels.getResponse().getStatusCode());
      System.exit(-1);
    }

    Arrays.stream(hotels)
        .map(Hotel::getName)
        .forEach(System.out::println);
  }
}
