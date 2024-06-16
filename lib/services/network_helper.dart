import 'dart:io';
import 'dart:async';

class NetworkHelper {

  static Future<bool> checkNetwork() async{
    bool networkResults = true;

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        networkResults = true;
      }
    } catch (e) {
      networkResults = false;
    }
    return networkResults;
  }

}