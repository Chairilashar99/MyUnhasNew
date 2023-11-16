import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/pages/home/dosen/home_screen_dosen.dart';
import 'package:my_unhas_new/pages/home/mahasiswa/home_screen_mahasiswa.dart';
import 'package:my_unhas_new/pages/home/wali/home_screen_wali.dart';

class RoutingView extends StatelessWidget {
  const RoutingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Palette.red,
          systemNavigationBarColor: Palette.white,
        ),
        backgroundColor: Palette.red,
        centerTitle: true,
        title: const Text('Routing View'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(Get.width, 50)),
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      textStyle: MaterialStateProperty.all(kTextTheme.bodyMedium
                          ?.copyWith(color: Palette.white)),
                      backgroundColor: MaterialStateProperty.all(Palette.red)),
                  onPressed: () => Get.to(() => const HomescreenDosen()),
                  child: const Text('Dosen')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(Get.width, 50)),
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      textStyle: MaterialStateProperty.all(kTextTheme.bodyMedium
                          ?.copyWith(color: Palette.white)),
                      backgroundColor: MaterialStateProperty.all(Palette.red)),
                  onPressed: () => Get.to(() => const HomescreenMahasiswa()),
                  child: const Text('Mahasiswa')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(Size(Get.width, 50)),
                      foregroundColor: MaterialStateColor.resolveWith(
                          (states) => Colors.white),
                      textStyle: MaterialStateProperty.all(kTextTheme.bodyMedium
                          ?.copyWith(color: Palette.white)),
                      backgroundColor: MaterialStateProperty.all(Palette.red)),
                  onPressed: () => Get.to(() => const HomescreenWali()),
                  child: const Text('E-Wali')),
            ),
          ],
        ).marginOnly(top: 30),
      ),
    );
  }
}
