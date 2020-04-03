import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Delay;

public class AirportOnTime {
  /**
   * <p>
   *   An example to call the AI-Generated Photos API
   *   <code>/v2/media/files/generated-photos</code> endpoints.
   * </p>
   *
   * <p>
   *   Access via the Amadeus client object.
   * </p>
   *
   * <pre>
   * Amadeus amadeus = Amadeus.builder("clientId", "secret").build();
   * amadeus.media.files.generatedPhotos;</pre>
   */
  public static void main(String[] args) throws ResponseException {


    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();
    Delay[] flightDelay = amadeus.travel.predictions.flightDelay.get(Params
    .with("originLocationCode", "NCE")
    .and("destinationLocationCode", "IST")
    .and("departureDate", "2020-08-01")
    .and("departureTime", "18:20:00")
    .and("arrivalDate", "2020-08-01")
    .and("arrivalTime", "22:15:00")
    .and("aircraftCode", "321")
    .and("carrierCode", "TK")
    .and("flightNumber", "1816")
    .and("duration", "PT31H10M"));

    if (flightDelay[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code for Flight Inspiration Search: " + flightDelay[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(flightDelay[0]);
  }
}