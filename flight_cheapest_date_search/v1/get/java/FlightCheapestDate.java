import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightDate;

public class FlightCheapestDate {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    FlightDate[] flightDates = amadeus.shopping.flightDates.get(Params
      .with("origin", "MAD")
      .and("destination", "MUC"));

    if(flightDates[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + (flightDates[0].getResponse().getStatusCode());
        System.exit(-1);
    }
    System.out.println((flightDates[0]);
  }
}