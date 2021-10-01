// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Period;

public class FlightBusiestPeriod {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    // Flight Busiest Traveling Period
    Period[] busiestPeriods = amadeus.travel.analytics.airTraffic.busiestPeriod.get(Params
      .with("cityCode", "MAD")
      .and("period", "2022")
      .and("direction", BusiestPeriod.ARRIVING));

    if(busiestPeriods[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + (busiestPeriods[0].getResponse().getStatusCode());
        System.exit(-1);
    }
    System.out.println((busiestPeriods[0]);
  }
}
