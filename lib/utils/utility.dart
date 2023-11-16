import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> getErrorMessages(dynamic message) {
  if (message is List) {
    List<dynamic> messages = message;
    var msg = messages.map((e) => e.toString()).toList();
    return msg;
  } else {
    return [message];
  }
}

void logout() async {
  var prefs = await SharedPreferences.getInstance();
  prefs.remove("access_token");
  prefs.remove("refresh_token");
  Get.deleteAll();
  Get.offAllNamed("/welcome");
}
