// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.SeatMap;

public class SeatMaps {
    public static void main(String[] args) throws ResponseException {

      Amadeus amadeus = Amadeus
              .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
              .build();

      String body = "{\"data\":[{\"type\":\"flight-offer\",\"id\":\"1\",\"source\":\"GDS\",\"instantTicketingRequired\":false,\"nonHomogeneous\":false,\"oneWay\":false,\"lastTicketingDate\":\"2020-03-04\",\"numberOfBookableSeats\":7,\"itineraries\":[{\"duration\":\"PT24H20M\",\"segments\":[{\"departure\":{\"iataCode\":\"NCE\",\"terminal\":\"2\",\"at\":\"2020-09-28T17:55:00\"},\"arrival\":{\"iataCode\":\"SVO\",\"terminal\":\"E\",\"at\":\"2020-09-28T22:40:00\"},\"carrierCode\":\"SU\",\"number\":\"2361\",\"aircraft\":{\"code\":\"321\"},\"operating\":{\"carrierCode\":\"SU\"},\"duration\":\"PT3H45M\",\"id\":\"49\",\"numberOfStops\":0,\"blacklistedInEU\":false},{\"departure\":{\"iataCode\":\"SVO\",\"terminal\":\"D\",\"at\":\"2020-09-29T09:20:00\"},\"arrival\":{\"iataCode\":\"JFK\",\"terminal\":\"1\",\"at\":\"2020-09-29T12:15:00\"},\"carrierCode\":\"SU\",\"number\":\"100\",\"aircraft\":{\"code\":\"77W\"},\"operating\":{\"carrierCode\":\"SU\"},\"duration\":\"PT9H55M\",\"id\":\"50\",\"numberOfStops\":0,\"blacklistedInEU\":false}]},{\"duration\":\"PT15H35M\",\"segments\":[{\"departure\":{\"iataCode\":\"JFK\",\"terminal\":\"1\",\"at\":\"2020-10-01T19:20:00\"},\"arrival\":{\"iataCode\":\"SVO\",\"terminal\":\"D\",\"at\":\"2020-10-02T11:45:00\"},\"carrierCode\":\"SU\",\"number\":\"103\",\"aircraft\":{\"code\":\"77W\"},\"operating\":{\"carrierCode\":\"SU\"},\"duration\":\"PT9H25M\",\"id\":\"133\",\"numberOfStops\":0,\"blacklistedInEU\":false},{\"departure\":{\"iataCode\":\"SVO\",\"terminal\":\"E\",\"at\":\"2020-10-02T13:55:00\"},\"arrival\":{\"iataCode\":\"NCE\",\"terminal\":\"2\",\"at\":\"2020-10-02T16:55:00\"},\"carrierCode\":\"SU\",\"number\":\"2360\",\"aircraft\":{\"code\":\"321\"},\"operating\":{\"carrierCode\":\"SU\"},\"duration\":\"PT4H\",\"id\":\"134\",\"numberOfStops\":0,\"blacklistedInEU\":false}]}],\"price\":{\"currency\":\"EUR\",\"total\":\"567.49\",\"base\":\"150.00\",\"fees\":[{\"amount\":\"0.00\",\"type\":\"SUPPLIER\"},{\"amount\":\"0.00\",\"type\":\"TICKETING\"}],\"grandTotal\":\"567.49\"},\"pricingOptions\":{\"fareType\":[\"PUBLISHED\"],\"includedCheckedBagsOnly\":true},\"validatingAirlineCodes\":[\"SU\"],\"travelerPricings\":[{\"travelerId\":\"1\",\"fareOption\":\"STANDARD\",\"travelerType\":\"ADULT\",\"price\":{\"currency\":\"EUR\",\"total\":\"567.49\",\"base\":\"150.00\"},\"fareDetailsBySegment\":[{\"segmentId\":\"49\",\"cabin\":\"ECONOMY\",\"fareBasis\":\"RVULA\",\"brandedFare\":\"ER\",\"class\":\"R\",\"includedCheckedBags\":{\"quantity\":1}},{\"segmentId\":\"50\",\"cabin\":\"ECONOMY\",\"fareBasis\":\"RVULA\",\"brandedFare\":\"ER\",\"class\":\"R\",\"includedCheckedBags\":{\"quantity\":1}},{\"segmentId\":\"133\",\"cabin\":\"ECONOMY\",\"fareBasis\":\"RVULA\",\"brandedFare\":\"ER\",\"class\":\"R\",\"includedCheckedBags\":{\"quantity\":1}},{\"segmentId\":\"134\",\"cabin\":\"ECONOMY\",\"fareBasis\":\"RVULA\",\"brandedFare\":\"ER\",\"class\":\"R\",\"includedCheckedBags\":{\"quantity\":1}}]}]}]}";

      SeatMap[] seatmap = amadeus.shopping.seatMaps.post(body);

      if (seatmap[0].getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + seatmap[0].getResponse().getStatusCode());
        System.exit(-1);
      }

      System.out.println(seatmap[0]);
    }
}




