package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.AirTraffic;

public class FlightMostBookedDestinations {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();

    // Flight Most Booked Destinations
    AirTraffic[] airTraffics = amadeus.travel.analytics.airTraffic.booked.get(Params
      .with("originCityCode", "MAD")
      .and("period", "2017-08"));

    System.out.println(flightDestinations);
  }
}

