import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/pages/widgets/blur_background_container.dart';
import 'package:my_unhas_new/pages/widgets/inkwell_container.dart';
import 'package:my_unhas_new/utils/utility.dart';

class LogoutModal extends StatelessWidget {
  const LogoutModal({Key? key});

  get center => null;

  @override
  Widget build(BuildContext context) {
    return BlurBackgroundContainer(
      modal: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 24,
          ),
          height: 220,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: Palette.white.withOpacity(.94),
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Yakin nih mau logout?',
                      style: kTextTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        'Tekan ya jika ingin melanjutkan',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWellContainer(
                              onTap: () {
                                Get.back();
                              },
                              radius: 18,
                              padding: const EdgeInsets.all(12),
                              color: Palette.green,
                              child: Text(
                                'Tidak',
                                style: kTextTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: InkWellContainer(
                              onTap: () {
                                logout();
                              },
                              radius: 18,
                              padding: const EdgeInsets.all(12),
                              color: Palette.red,
                              child: Text(
                                'Ya',
                                style: kTextTheme.bodyMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Palette.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -48,
                  child: InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      radius: 16,
                      backgroundColor: Palette.white,
                      child: Icon(
                        Icons.close,
                        color: Palette.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
