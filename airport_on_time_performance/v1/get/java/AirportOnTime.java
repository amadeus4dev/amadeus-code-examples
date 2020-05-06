package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.AirportOnTime;

public class AirportOnTime {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();
    OnTime onTime = amadeus.airport.predictions.onTime.get(Params
        .with("airportCode", "NCE")
        .and("date", "2020-09-01"));

    System.out.println(onTime);
  }
}