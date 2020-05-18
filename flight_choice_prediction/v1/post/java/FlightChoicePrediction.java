import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOfferSearch;

public class FlightChoicePrediction {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();

    FlightOffer[] flightOffers = amadeus.shopping.flightOffers
            .get(Params.with("origin", "MAD").and("destination", "NYC").and("departureDate", "2020-08-01").and("max", "2"));

    // Using a JSonObject
    JsonObject result = flightOffers[0].getResponse().getResult();
    FlightOffer[] flightOffersPrediction = amadeus.shopping.flightOffers.prediction.post(result);

    if(flightOffersPrediction[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + (flightOffersPrediction[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println((flightOffersPrediction[0]);

    // Using a String
    String body = flightOffers[0].getResponse().getBody();
    FlightOffer[] flightOffersPrediction = amadeus.shopping.flightOffers.prediction.post(body);

    if(flightOffersPrediction[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + (flightOffersPrediction[0].getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println((flightOffersPrediction[0]);
  }
}