package examples.media.files;

import com.amadeus.Amadeus;
import com.amadeus.Params;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.GeneratedPhoto;

public class AIGeneratedPhotos {

  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("YOUR_API_ID","YOUR_API_SECRET")
        .build();

    GeneratedPhoto photo = amadeus.media.files.generatedPhotos.get(Params
        .with("category", "BEACH"));
    System.out.println(photo);
  }
}
