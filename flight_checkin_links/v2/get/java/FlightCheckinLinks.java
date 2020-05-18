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

    if(checkinLinks[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + (checkinLinks[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println((checkinLinks[0]);
  }
}