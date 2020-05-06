package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Airline;

public class AirlineCodeLookup {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();

    Airline[] airlines = amadeus.referenceData.airlines.get(Params
      .with("airlineCodes", "BA"));

    System.out.println(airlines);
  }
}
