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

    if (airlines[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + airlines[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(airlines);
  }
}
