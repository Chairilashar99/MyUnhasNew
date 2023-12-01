import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_unhas_new/constants/asset_path.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/pages/auth/login_modal.dart';

import 'package:rive/rive.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.grey,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned.fill(
            child: RiveAnimation.asset(
              AssetPath.getRive('anim_bg.riv'),
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
              child: const SizedBox.shrink(),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'My',
                          style: kTextTheme.headlineMedium?.copyWith(
                            color: Palette.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Unhas',
                          style: kTextTheme.headlineMedium?.copyWith(
                            color: Palette.red,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 310,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'Sistem Kelola',
                            style: kTextTheme.displayLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              height: 1.05,
                              color: Palette.black,
                            ),
                            children: [
                              TextSpan(
                                text: '\nAkademik & E-Wali',
                                style: kTextTheme.displayLarge?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  height: 1.05,
                                  color: Palette.red,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Membantu pengelolaan data akademik dan pemantauan akademik mahasiswa oleh wali di Universitas Hasanuddin.",
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  buildLoginButton(
                    text: 'Masuk Sebagai Mahasiswa',
                    userType: 'mahasiswa',
                  ),
                  const SizedBox(height: 10),
                  buildLoginButton(
                    text: 'Masuk Sebagai Wali',
                    userType: 'wali',
                  ),
                  const SizedBox(height: 10),
                  buildLoginButton(
                    text: 'Masuk Sebagai Dosen',
                    userType: 'dosen',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Text(
                      "Lanjutkan untuk mulai menggunakan MyUnhas.",
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLoginButton({required String text, required String userType}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Palette.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            spreadRadius: 1,
            blurRadius: 6,
            color: const Color.fromARGB(255, 75, 63, 189).withOpacity(.2),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          Get.dialog(
            LoginModal(userType: userType),
            arguments: {"userType": userType},
            barrierDismissible: true,
            transitionDuration: const Duration(milliseconds: 400),
            transitionCurve: Curves.easeInOut,
            barrierColor: Colors.black.withOpacity(0.5),
          );
        },
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 8),
              Text(
                text,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
