// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.ItineraryPriceMetric;

public class FlightPriceAnalysis {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();

    // What's the flight price analysis from MAD to CDG
    ItineraryPriceMetric[] metrics = amadeus.analytics.itineraryPriceMetrics.get(Params
        .with("originIataCode", "MAD")
        .and("destinationIataCode", "CDG")
        .and("departureDate", "2021-03-21"));

    if (metrics[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + metrics[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(metrics[0]);
  }
}