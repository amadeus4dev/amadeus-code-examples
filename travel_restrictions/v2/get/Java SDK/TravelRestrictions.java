// How to install the library at https://github.com/amadeus4dev/amadeus-java

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.DiseaseReport;

public class TravelRestrictions {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_AMADEUS_API_KEY","YOUR_AMADEUS_API_SECRET")
        .build();

    //What are the Covid19 restrictions for the USA?
    DiseaseReport diseaseReport = amadeus.dutyOfCare.diseases.covid19Report.get(Params.with("countryCode","US"));

    if (diseaseReport.getResponse().getStatusCode() != 200) {
        System.out.println("Wrong status code: " + diseaseReport.getResponse().getStatusCode());
        System.exit(-1);
    }

    System.out.println(diseaseReport);
  }
}
