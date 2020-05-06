package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightDate;

public class FlightCheapestDate {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();
    FlightDate[] flightDates = amadeus.shopping.flightDates.get(Params
      .with("origin", "MAD")
      .and("destination", "MUC"));

    System.out.println(flightDates);
  }
}