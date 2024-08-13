import com.amadeus.Amadeus;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.HotelOrder;

public class FlightSearch {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_CLIENT_ID","YOUR_AMADEUS_CLIENT_SECRET")
        .build();

    String body = "{\n" +
        "  \"data\": {\n" +
        "    \"type\": \"hotel-order\",\n" +
        "    \"guests\": [\n" +
        "      {\n" +
        "        \"tid\": 1,\n" +
        "        \"title\": \"MR\",\n" +
        "        \"firstName\": \"BOB\",\n" +
        "        \"lastName\": \"SMITH\",\n" +
        "        \"phone\": \"+33679278416\",\n" +
        "        \"email\": \"bob.smith@email.com\"\n" +
        "      }\n" +
        "    ],\n" +
        "    \"travelAgent\": {\n" +
        "      \"contact\": {\n" +
        "        \"email\": \"bob.smith@email.com\"\n" +
        "      }\n" +
        "    },\n" +
        "    \"roomAssociations\": [\n" +
        "      {\n" +
        "        \"guestReferences\": [\n" +
        "          {\n" +
        "            \"guestReference\": \"1\"\n" +
        "          }\n" +
        "        ],\n" +
        "        \"hotelOfferId\": \"HL2E6A0IQZ\"\n" +
        "      }\n" +
        "    ],\n" +
        "    \"payment\": {\n" +
        "      \"method\": \"CREDIT_CARD\",\n" +
        "      \"paymentCard\": {\n" +
        "        \"paymentCardInfo\": {\n" +
        "          \"vendorCode\": \"VI\",\n" +
        "          \"cardNumber\": \"4151289722471370\",\n" +
        "          \"expiryDate\": \"2026-08\",\n" +
        "          \"holderName\": \"BOB SMITH\"\n" +
        "        }\n" +
        "      }\n" +
        "    }\n" +
        "  }\n" +
        "}";
    
    HotelOrder hotel = amadeus.booking.hotelOrders.post(body);

    if(hotel.getResponse().getStatusCode() != 201) {
      System.out.println("Wrong status code: " + hotel.getResponse().getStatusCode());
      System.exit(-1); 
    }
    
    System.out.println(hotel);
  }

}
