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

String getPeriod() {
  DateTime now = DateTime.now();
  int currentYear = now.year;
  int currentMonth = now.month;

  // priode pertama januari sampe juni
  if (currentMonth >= 1 && currentMonth <= 6) {
    int startYear = currentYear - 1;
    int endYear = currentYear;
    String startSemester = 'Semester Akhir';
    String endSemester = '';
    return '$startSemester $startYear/$endSemester$endYear';
    //peridoe kedua juli sampe desember
  } else if (currentMonth >= 7 && currentMonth <= 12) {
    int startYear = currentYear;
    int endYear = currentYear + 1;
    String startSemester = 'Semester Awal';
    String endSemester = '';
    return '$startSemester $startYear/$endSemester$endYear';
  } else {
    return 'Periode Tidak Diketahui';
  }
}

String getGreeting() {
  var hour = DateTime.now().hour;
  if (hour >= 6 && hour < 12) {
    return 'Selamat Pagi';
  } else if (hour >= 11 && hour < 15) {
    return 'Selamat Siang';
  } else if (hour >= 15 && hour < 18) {
    return 'Selamat Sore';
  } else {
    return 'Selamat Malam';
  }
}
