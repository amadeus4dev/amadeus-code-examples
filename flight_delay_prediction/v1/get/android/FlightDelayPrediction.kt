// How to install the library at https://github.com/amadeus4dev/amadeus-android

import com.amadeus.android.Amadeus
import com.amadeus.android.ApiResult
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch
import android.util.Log;

val job = SupervisorJob()
val scope = CoroutineScope(Dispatchers.Main + job)

val amadeus = Amadeus.Builder(context)
    .setClientId("REPLACE_BY_YOUR_API_KEY")
    .setClientSecret("REPLACE_BY_YOUR_API_SECRET")
    .build()

scope.launch {
  when (val flightDelay = amadeus.travel.predictions.flightDelay.get(
                    originLocationCode = "NCE",
                    destinationLocationCode = "IST",
                    departureDate = "2020-08-01",
                    departureTime = "18:20:00",
                    arrivalDate = "2020-08-01",
                    arrivalTime = "22:15:00",
                    aircraftCode = "321",
                    carrierCode = "TK",
                    flightNumber = "1816",
                    duration = "PT31H10M")) {
    is ApiResult.Success -> {
      Log.d("Result", "${result.data}")
    }
    is ApiResult.Error -> {
      // Handle your error
    }
  }
}
