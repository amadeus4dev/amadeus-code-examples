// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.City;

public class CitySearch {

  public static void main(String[] args) throws ResponseException {
    Amadeus amadeus = Amadeus
      .builder("YOUR_AMADEUS_API_KEY", "YOUR_AMADEUS_API_SECRET")
      .build();

    City[] cities = amadeus.referenceData.locations.cities.get(
      Params.with("keyword","PARIS")
    );

    if (cities[0].getResponse().getStatusCode() != 200) {
      System.out.println("Wrong status code: " + cities[0].getResponse().getStatusCode());
      System.exit(-1);
    }

    System.out.println(cities[0]);
  }
}
