import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.AirTraffic;

public class FlightMostTraveledDestinations {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    // Flight Most Traveled Destinations
    AirTraffic[] airTraffics = amadeus.travel.analytics.airTraffic.traveled.get(Params
      .with("originCityCode", "MAD")
      .and("period", "2017-01"));

    if (airTraffics[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + airTraffics[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(airTraffics[0]);
  }
}


