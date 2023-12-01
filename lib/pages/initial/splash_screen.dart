import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_unhas_new/constants/asset_path.dart';
import 'package:my_unhas_new/constants/color_const.dart';

import '../../services/basic_client.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isAuthenticated = false;

  // @override
  // void didChangeDependencies() {
  //   // Will change page after two second
  //   super.didChangeDependencies();
  //   Timer(const Duration(seconds: 5), () {
  //     if (mounted) {
  //       Get.offNamed('/wrapper');
  //     }
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(const Duration(seconds: 5), () async {
  //     if (await TokenManager.getAccessToken() != null) {
  //       Get.offNamed('/homescreen-wali');
  //     }
  //     if (await TokenManager.getAccessToken() != null) {
  //       Get.offNamed('/homescreen-dosen');
  //     }
  //     if (await TokenManager.getAccessToken() != null) {
  //       Get.offNamed('/homescreen-mahasiswa');
  //     } else {
  //       Get.offNamed('/welcome');
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () async {
      var accessToken = await TokenManager.getAccessToken();
      if (accessToken != null) {
        Get.offNamed('/homescreen-wali');
      } else if (accessToken != null) {
        Get.offNamed('/homescreen-dosen');
      } else if (accessToken != null) {
        Get.offNamed('/homescreen-mahasiswa');
      } else {
        Get.offNamed('/welcome');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                color: Palette.red,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: SvgPicture.asset(
                AssetPath.getVector('bg_attribute_1.svg'),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: RotatedBox(
                quarterTurns: -2,
                child: SvgPicture.asset(
                  AssetPath.getVector('bg_attribute_1.svg'),
                ),
              ),
            ),
            Positioned.fill(
              child: SizedBox(
                height: 116,
                width: 116,
                child: Image.asset(
                  AssetPath.getImage('logo-putih.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
