// How to install the library at https://github.com/amadeus4dev/amadeus-java
import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.TransferOrder;

public class TransferOrders {

    public static void main(String[] args) throws ResponseException {

        Amadeus amadeus = Amadeus
                .builder("YOUR_AMADEUS_API_KEY", "YOUR_AMADEUS_API_SECRET")
                .build();
        Params params = Params.with("offerId", "5976726751");

        String body = "{\n  \"data\": {\n    \"note\": \"Note to driver\",\n    \"passengers\": [\n      {\n        \"firstName\": \"John\",\n        \"lastName\": \"Doe\",\n        \"title\": \"MR\",\n        \"contacts\": {\n          \"phoneNumber\": \"+33123456789\",\n          \"email\": \"user@email.com\"\n        },\n        \"billingAddress\": {\n          \"line\": \"Avenue de la Bourdonnais, 19\",\n          \"zip\": \"75007\",\n          \"countryCode\": \"FR\",\n          \"cityName\": \"Paris\"\n        }\n      }\n    ],\n    \"agency\": {\n      \"contacts\": [\n        {\n          \"email\": {\n            \"address\": \"abc@test.com\"\n          }\n        }\n      ]\n    },\n    \"payment\": {\n      \"methodOfPayment\": \"CREDIT_CARD\",\n      \"creditCard\": {\n        \"number\": \"4111111111111111\",\n        \"holderName\": \"JOHN DOE\",\n        \"vendorCode\": \"VI\",\n        \"expiryDate\": \"0928\",\n        \"cvv\": \"111\"\n      }\n    },\n    \"extraServices\": [\n      {\n        \"code\": \"EWT\",\n        \"itemId\": \"EWT0291\"\n      }\n    ],\n    \"equipment\": [\n      {\n        \"code\": \"BBS\"\n      }\n    ],\n    \"corporation\": {\n      \"address\": {\n        \"line\": \"5 Avenue Anatole France\",\n        \"zip\": \"75007\",\n        \"countryCode\": \"FR\",\n        \"cityName\": \"Paris\"\n      },\n      \"info\": {\n        \"AU\": \"FHOWMD024\",\n        \"CE\": \"280421GH\"\n      }\n    },\n    \"startConnectedSegment\": {\n      \"transportationType\": \"FLIGHT\",\n      \"transportationNumber\": \"AF380\",\n      \"departure\": {\n        \"uicCode\": \"7400001\",\n        \"iataCode\": \"CDG\",\n        \"localDateTime\": \"2023-03-27T20:03:00\"\n      },\n      \"arrival\": {\n        \"uicCode\": \"7400001\",\n        \"iataCode\": \"CDG\",\n        \"localDateTime\": \"2023-03-27T20:03:00\"\n      }\n    },\n    \"endConnectedSegment\": {\n      \"transportationType\": \"FLIGHT\",\n      \"transportationNumber\": \"AF380\",\n      \"departure\": {\n        \"uicCode\": \"7400001\",\n        \"iataCode\": \"CDG\",\n        \"localDateTime\": \"2023-03-27T20:03:00\"\n      },\n      \"arrival\": {\n        \"uicCode\": \"7400001\",\n        \"iataCode\": \"CDG\",\n        \"localDateTime\": \"2023-03-27T20:03:00\"\n      }\n    }\n  }\n}";
        
        TransferOrder transfers = amadeus.ordering.tranferOrders.post(body, params);
        if (transfers.getResponse().getStatusCode() != 200) {
            System.out.println("Wrong status code: " + transfers.getResponse().getStatusCode());
            System.exit(-1);
        }

        System.out.println(transfers);
    }
}
