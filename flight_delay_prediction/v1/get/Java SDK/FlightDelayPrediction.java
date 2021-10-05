// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Delay;

public class FlightDelayPrediction {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    Delay[] flightDelay = amadeus.travel.predictions.flightDelay.get(Params
    .with("originLocationCode", "NCE")
    .and("destinationLocationCode", "IST")
    .and("departureDate", "2022-08-01")
    .and("departureTime", "18:20:00")
    .and("arrivalDate", "2022-08-01")
    .and("arrivalTime", "22:15:00")
    .and("aircraftCode", "321")
    .and("carrierCode", "TK")
    .and("flightNumber", "1816")
    .and("duration", "PT31H10M"));

    if (flightDelay[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + flightDelay[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(flightDelay[0]);
  }
}