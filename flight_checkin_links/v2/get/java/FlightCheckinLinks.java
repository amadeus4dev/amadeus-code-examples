package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.CheckinLink;

public class FlightCheckinLinks {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();
    CheckinLink[] checkinLinks = amadeus.referenceData.urls.checkinLinks.get(Params
      .with("airlineCode", "BA"));

    System.out.println(flightDates);
  }
}