package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Period;

public class FlightBusiestPeriod {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();

    // Flight Busiest Traveling Period
    Period[] busiestPeriods = amadeus.travel.analytics.airTraffic.busiestPeriod.get(Params
      .with("cityCode", "MAD")
      .and("period", "2017")
      .and("direction", BusiestPeriod.ARRIVING));

    System.out.println(busiestPeriods);
  }
}
