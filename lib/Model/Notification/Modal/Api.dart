import 'dart:io';

import 'package:http/http.dart' as http;

class Api {
  final HttpClient httpClient = HttpClient();
  final String fcmUrl = 'https://fcm.googleapis.com/fcm/send';
  final fcmKey =
      "caO7ESr5QxS7wDkL5T_laK:APA91bH5a4Lp_eEPsAgRRqmAdY3bNhPbiXvOLTjC7Wm4pPILdpWb5BAZol9WZDyvtYQEgy0xlcBtyoODsFG7fLHXDdu4d6LAZWoQYrXsa80kkZKxhOWJjxPloO2KTcMB2LKVnPlo690y";

  void sendFcm(String title, String body, List<dynamic> fcmToken) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'key=$fcmKey'
    };
    var request = http.Request('POST', Uri.parse(fcmUrl));
    request.body =
        '''{"to":"/topics/all_users","priority":"high","notification":{"title":"$title","body":"$body","sound": "default"}}''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}