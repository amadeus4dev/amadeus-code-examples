import com.amadeus.Amadeus;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.FlightOrder;

public class FlightCreateOrder {

  public static void main(String[] args) throws ResponseException {
      Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();

      String body = "{\"data\":{\"type\":\"flight-order\",\"flightOffers\":[{\"type\":\"flight-offer\",\"id\":\"1\",\"source\":\"GDS\",\"instantTicketingRequired\":false,\"nonHomogeneous\":false,\"oneWay\":false,\"lastTicketingDate\":\"2020-04-01\",\"numberOfBookableSeats\":6,\"itineraries\":[{\"duration\":\"PT3H50M\",\"segments\":[{\"departure\":{\"iataCode\":\"ATH\",\"at\":\"2020-04-01T08:50:00\"},\"arrival\":{\"iataCode\":\"MAD\",\"terminal\":\"2\",\"at\":\"2020-04-01T11:40:00\"},\"carrierCode\":\"A3\",\"number\":\"700\",\"aircraft\":{\"code\":\"321\"},\"operating\":{\"carrierCode\":\"A3\"},\"duration\":\"PT3H50M\",\"id\":\"99\",\"numberOfStops\":0,\"blacklistedInEU\":false}]}],\"price\":{\"currency\":\"EUR\",\"total\":\"76.69\",\"base\":\"44.00\",\"fees\":[{\"amount\":\"0.00\",\"type\":\"SUPPLIER\"},{\"amount\":\"0.00\",\"type\":\"TICKETING\"}],\"grandTotal\":\"76.69\",\"additionalServices\":[{\"amount\":\"30.00\",\"type\":\"CHECKED_BAGS\"}]},\"pricingOptions\":{\"fareType\":[\"PUBLISHED\"],\"includedCheckedBagsOnly\":false},\"validatingAirlineCodes\":[\"A3\"],\"travelerPricings\":[{\"travelerId\":\"1\",\"fareOption\":\"STANDARD\",\"travelerType\":\"ADULT\",\"price\":{\"currency\":\"EUR\",\"total\":\"76.69\",\"base\":\"44.00\"},\"fareDetailsBySegment\":[{\"segmentId\":\"99\",\"cabin\":\"ECONOMY\",\"fareBasis\":\"UNOBAGD\",\"brandedFare\":\"GOLIGHT\",\"class\":\"U\",\"includedCheckedBags\":{\"quantity\":0}}]}]}],\"travelers\":[{\"id\":\"1\",\"dateOfBirth\":\"1982-01-16\",\"name\":{\"firstName\":\"JORGE\",\"lastName\":\"GONZALES\"},\"gender\":\"MALE\",\"contact\":{\"emailAddress\":\"jorge.gonzales833@telefonica.es\",\"phones\":[{\"deviceType\":\"MOBILE\",\"countryCallingCode\":\"34\",\"number\":\"480080076\"}]},\"documents\":[{\"documentType\":\"PASSPORT\",\"birthPlace\":\"Madrid\",\"issuanceLocation\":\"Madrid\",\"issuanceDate\":\"2015-04-14\",\"number\":\"00000000\",\"expiryDate\":\"2025-04-14\",\"issuanceCountry\":\"ES\",\"validityCountry\":\"ES\",\"nationality\":\"ES\",\"holder\":true}]},{\"id\":\"2\",\"dateOfBirth\":\"2012-10-11\",\"gender\":\"FEMALE\",\"contact\":{\"emailAddress\":\"jorge.gonzales833@telefonica.es\",\"phones\":[{\"deviceType\":\"MOBILE\",\"countryCallingCode\":\"34\",\"number\":\"480080076\"}]},\"name\":{\"firstName\":\"ADRIANA\",\"lastName\":\"GONZALES\"}}],\"remarks\":{\"general\":[{\"subType\":\"GENERAL_MISCELLANEOUS\",\"text\":\"ONLINE BOOKING FROM INCREIBLE VIAJES\"}]},\"ticketingAgreement\":{\"option\":\"DELAY_TO_CANCEL\",\"delay\":\"6D\"},\"contacts\":[{\"addresseeName\":{\"firstName\":\"PABLO\",\"lastName\":\"RODRIGUEZ\"},\"companyName\":\"INCREIBLE VIAJES\",\"purpose\":\"STANDARD\",\"phones\":[{\"deviceType\":\"LANDLINE\",\"countryCallingCode\":\"34\",\"number\":\"480080071\"},{\"deviceType\":\"MOBILE\",\"countryCallingCode\":\"33\",\"number\":\"480080072\"}],\"emailAddress\":\"support@increibleviajes.es\",\"address\":{\"lines\":[\"Calle Prado, 16\"],\"postalCode\":\"28014\",\"cityName\":\"Madrid\",\"countryCode\":\"ES\"}}]}}";
      FlightOrder order = amadeus.booking.flightOrders.post(body);

      if (order.getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + order.getResponse().getStatusCode());
        System.exit(-1);
      }

       System.out.println(order);
     }
}