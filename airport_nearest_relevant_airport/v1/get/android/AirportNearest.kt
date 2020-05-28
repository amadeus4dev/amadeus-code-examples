// How to install the library at https://github.com/amadeus4dev/amadeus-android

import com.amadeus.android.Amadeus
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
  when (val locations = amadeus.referenceData.locations.airports.get(
                  latitude = 40.416775,
                  longitude = -3.703790)) {
    is Result.Success -> {
      Log.d("Result", "${result.data}")
    }
    is Result.Error -> {
      // Handle your error
    }
  }
}
