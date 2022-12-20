// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOfferSearch;

public class BrandedFaresUpsell {

  public static void main(String[] args) throws ResponseException {

        Amadeus amadeus = Amadeus
            .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
            .build();

        FlightOfferSearch[] flightOffersSearches = amadeus.shopping.flightOffersSearch.get(
            Params.with("originLocationCode", "SYD")
                    .and("destinationLocationCode", "BKK")
                    .and("departureDate", "2023-11-01")
                    .and("returnDate", "2023-11-08")
                    .and("adults", 1)
                    .and("max", 2));

        FlightOfferSearch[] upsellFlightOffers = amadeus.shopping.flightOffers.upselling.post(flightOffersSearches[0]);

        if (upsellFlightOffers[0].getResponse().getStatusCode() != 200) {
            System.out.println("Wrong status code: " + upsellFlightOffers[0].getResponse().getStatusCode());
            System.exit(-1);
        }

        System.out.println(upsellFlightOffers[0]);
    }
}