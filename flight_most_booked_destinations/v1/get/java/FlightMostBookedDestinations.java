import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.AirTraffic;

public class FlightMostBookedDestinations {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    // Flight Most Booked Destinations
    AirTraffic[] airTraffics = amadeus.travel.analytics.airTraffic.booked.get(Params
      .with("originCityCode", "MAD")
      .and("period", "2017-08"));

    if (airTraffics[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + airTraffics[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(airTraffics[0]);
  }
}

