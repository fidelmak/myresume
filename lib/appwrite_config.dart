// Import the Appwrite Dart SDK
import 'package:appwrite/appwrite.dart';

// Initialize the Appwrite client
class Let {
  Client client = Client();
  myclient() {
    var kthis = client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('6555f261cf69c37f0043')
        .setSelfSigned(status: true);
    return kthis; // For self signed certificates, only use for development
  }
}
