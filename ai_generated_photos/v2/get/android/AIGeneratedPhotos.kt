// How to install the library at https://github.com/amadeus4dev/amadeus-android

import com.amadeus.android.Amadeus
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch

val job = SupervisorJob()
val scope = CoroutineScope(Dispatchers.Main + job)

val amadeus = Amadeus.Builder(context)
    .setClientId("REPLACE_BY_YOUR_API_KEY")
    .setClientSecret("REPLACE_BY_YOUR_API_SECRET")
    .build()
zz
// Your kotlin Coroutine scope
scope.launch {
  when (val result = amadeus.media.files.generatedPhotos.get("MOUNTAIN"))) {
    is Result.Success -> {
      if (result.succeeded) {
        Log.d("{$result.data}")
      } else {
        println(result.data)
      }
    }
    is Result.Error -> // Handle your error
  }
}
