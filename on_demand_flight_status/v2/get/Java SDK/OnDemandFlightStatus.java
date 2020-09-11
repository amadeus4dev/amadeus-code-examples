// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.Response;
import com.amadeus.resources.DatedFlight;

public class OnDemandFlightStatus {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    // Returns the status of a given flight
    DatedFlight[] flightStatus = amadeus.schedule.flights.get(Params
        .with("flightNumber", "319")
        .and("carrierCode", "AZ")
        .and("scheduledDepartureDate", "2021-03-13"));

   if (flightStatus[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + flightStatus[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(flightStatus[0]);
  }
}