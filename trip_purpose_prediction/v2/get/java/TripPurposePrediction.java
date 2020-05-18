import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.Prediction;

public class TripPurposePrediction {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    // Predict the purpose of the trip: business or leisure
    Prediction tripPurpose = amadeus.travel.predictions.tripPurpose.get(Params
        .with("originLocationCode", "NYC")
        .and("destinationLocationCode", "MAD")
        .and("departureDate", "2020-08-01")
        .and("returnDate", "2020-08-12"));

    if(tripPurpose.getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code" + tripPurpose.getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(tripPurpose);
  }
}
