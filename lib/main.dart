import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:my_unhas_new/pages/home/dosen/home_screen_dosen.dart';
import 'package:my_unhas_new/pages/home/mahasiswa/home_screen_mahasiswa.dart';
import 'package:my_unhas_new/pages/home/mahasiswa/pages/grafikpage_mahasiswa.dart';
import 'package:my_unhas_new/pages/home/mahasiswa/pages/jadwalpage_mahasiswa.dart';
import 'package:my_unhas_new/pages/home/mahasiswa/pages/kalenderpage_mahasiswa.dart';
import 'package:my_unhas_new/pages/home/mahasiswa/pages/profilepage_mahasiswa.dart';
import 'package:my_unhas_new/pages/home/wali/home_screen_wali.dart';
import 'package:my_unhas_new/pages/home/welcome_page.dart';
import 'package:my_unhas_new/pages/initial/splash_screen.dart';
import 'package:my_unhas_new/pages/menu/dosen/profile/screens/change_password_screen_dosen.dart';
import 'package:my_unhas_new/pages/menu/dosen/profile/screens/form_personal_data_dosen.dart';
import 'package:my_unhas_new/pages/menu/dosen/profile/screens/personal_data_screen_dosen.dart';
import 'package:my_unhas_new/pages/menu/dosen/profile/screens/riwayat_screen_dosen.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/screens/change_password_screen.dart.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/screens/personal_data_screen.dart';
import 'package:my_unhas_new/pages/menu/wali/profile/change_password_screen_wali.dart';
import 'package:my_unhas_new/pages/routing_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: "/splash",
      debugShowCheckedModeBanner: false,
      routes: {
        //MAHASISWA
        '/homescreen-mahasiswa': (context) => const HomescreenMahasiswa(),
        '/grafikscreen-mahasiswa': (context) => GrafikpageMahasiswa(),
        '/jadwalscreen-mahasiswa': (context) => const JadwalpageMahasiswa(),
        '/kalenderscreen-mahasiswa': (context) => const KalenderpageMahasiswa(),
        '/profilescreen-mahasiswa': (context) => ProfilepageMahasiswa(),
        '/personal-data-mahasiswa': (context) => PersonalDataScreen(),
        '/change-password-mahasiswa': (context) => const ChangePasswordScreen(),

        //DOSEN
        '/homescreen-dosen': (context) => const HomescreenDosen(),
        '/riwayat-dosen': (context) => const RiwayatScreenDosen(),
        '/change-password-dosen': (context) =>
            const ChangePasswordScreenDosen(),
        '/personal-data-dosen': (context) => const PersonalDataScreenDosen(),
        '/form-personal-data-dosen': (context) => const FormPersonalDataDosen(),

        //WALI
        '/homescreen-wali': (context) => const HomescreenWali(),
        '/change-password-wali': (context) => const ChangePasswordScreenWali(),

        //INITIAL
        '/welcome': (context) => const WelcomePage(),
        '/splash': (context) => const SplashScreen(),
        '/routingView': (context) => const RoutingView(),
      },
    );
  }
}
