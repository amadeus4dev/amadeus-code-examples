package examples.hotel.booking;

import com.amadeus.Amadeus;
import com.amadeus.exceptions.ResponseException;
import com.amadeus.resources.HotelBooking;

public class HotelBookings {
  /**
   * <p>
   *   An example to call hotel Booking API
   *   <code>/v1/booking/hotel-bookings</code> endpoints.
   * </p>
   *
   * <p>
   *   Access via the Amadeus client object.
   * </p>
   *
   * <pre>
   * Amadeus amadeus = Amadeus.builder("clientId", "secret").build();
   * amadeus.booking.hotelBookings;</pre>
   */
  public static void main(String[] args) throws ResponseException {

    Amadeus amadeus = Amadeus
        .builder("REPLACE_BY_YOUR_API_KEY","REPLACE_BY_YOUR_API_SECRET")
        .build();
    String body = "{\"data\""
        + ":{\"offerId\":\"2F5B1C3B215FA11FD5A44BE210315B18FF91BDA2FEDDD879907A3798F41D1C28\""
        + ",\"guests\":[{\"id\":1,\"name\":{\"title\":\"MR\",\"firstName\":\"BOB\","
        + "\"lastName\" :\"SMITH\"},\"contact\":{\"phone\":\"+33679278416\",\""
        + "email\":\"bob.smith@email.com\"}}],\""
        + "payments\":[{\"id\":1,\"method\":\"creditCard\",\""
        + "card\":{\"vendorCode\":\"VI\",\"cardNumber\""
        + ":\"4151289722471370\",\"expiryDate\":\"2021-08\"}}]}}";
    HotelBooking[] hotel = amadeus.booking.hotelBookings.post(body);
    System.out.println(hotel[0].getId());
  }
}
