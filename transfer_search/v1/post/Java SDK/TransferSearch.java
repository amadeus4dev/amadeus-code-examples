// How to install the library at https://github.com/amadeus4dev/amadeus-java
import com.amadeus.Amadeus;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.TransferOffersPost;

public class TransferSearch {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY", "YOUR_AMADEUS_API_SECRET")
        .build();

    String body = "{\"startLocationCode\":\"CDG\",\"endAddressLine\":\"AvenueAnatoleFrance,5\",\"endCityName\":\"Paris\",\"endZipCode\":\"75007\",\"endCountryCode\":\"FR\",\"endName\":\"SouvenirsDeLaTour\",\"endGeoCode\":\"48.859466,2.2976965\",\"transferType\":\"PRIVATE\",\"startDateTime\":\"2023-11-10T10:30:00\",\"providerCodes\":\"TXO\",\"passengers\":2,\"stopOvers\":[{\"duration\":\"PT2H30M\",\"sequenceNumber\":1,\"addressLine\":\"AvenuedelaBourdonnais,19\",\"countryCode\":\"FR\",\"cityName\":\"Paris\",\"zipCode\":\"75007\",\"name\":\"DeLaTours\",\"geoCode\":\"48.859477,2.2976985\",\"stateCode\":\"FR\"}],\"startConnectedSegment\":{\"transportationType\":\"FLIGHT\",\"transportationNumber\":\"AF380\",\"departure\":{\"localDateTime\":\"2023-11-10T09:00:00\",\"iataCode\":\"NCE\"},\"arrival\":{\"localDateTime\":\"2023-11-10T10:00:00\",\"iataCode\":\"CDG\"}},\"passengerCharacteristics\":[{\"passengerTypeCode\":\"ADT\",\"age\":20},{\"passengerTypeCode\":\"CHD\",\"age\":10}]}";

    TransferOffersPost[] transfers = amadeus.shopping.transferOffers.post(body);

    if (transfers[0].getResponse().getStatusCode() != 200) {
      System.out.println("Wrong status code: " + transfers[0].getResponse().getStatusCode());
      System.exit(-1);
    }

    System.out.println(transfers[0]);
  }
}
