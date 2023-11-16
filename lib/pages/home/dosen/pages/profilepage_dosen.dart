import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_unhas_new/constants/asset_path.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/pages/widgets/inkwell_container.dart';

class ProfilePageDosen extends StatelessWidget {
  const ProfilePageDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 120,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Palette.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                      ),
                      child: SvgPicture.asset(
                        AssetPath.getVector('ellipse_2.svg'),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: SvgPicture.asset(
                      AssetPath.getVector('ellipse_1.svg'),
                    ),
                  ),
                ],
              ),
            ),
            Transform.translate(
              offset: const Offset(0, 60),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4.0,
                      ),
                    ),
                    child: const CircleAvatar(
                      radius: 46,
                      backgroundImage: NetworkImage(
                        "https://i.ibb.co/PGv8ZzG/me.jpg",
                      ),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 15,
                    backgroundColor: Palette.red,
                    child: Icon(
                      Icons.camera_alt,
                      size: 15,
                      color: Palette.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 50.0),
        Text(
          "Prof. Dr. Ir. Achmar Mallawa, DEA.",
          style: kTextTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "195112221976031001",
          style: kTextTheme.titleSmall?.copyWith(
            color: Palette.red,
          ),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              InkWellContainer(
                onTap: () {
                  Get.toNamed('/personal-data-dosen');
                },
                padding: const EdgeInsets.symmetric(vertical: 6),
                color: Palette.white,
                radius: 8.0,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
                child: ListTile(
                  leading: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Palette.pinkDark.withOpacity(0.3),
                      ),
                      const Icon(
                        Icons.person,
                        size: 20,
                        color: Palette.red,
                      ),
                    ],
                  ),
                  minLeadingWidth: 0.0,
                  title: Text(
                    "Data Pribadi",
                    style: kTextTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Palette.black,
                    size: 24.0,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              InkWellContainer(
                onTap: () {
                  Get.toNamed('/riwayat-dosen');
                },
                padding: const EdgeInsets.symmetric(vertical: 6),
                color: Palette.white,
                radius: 8.0,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
                child: ListTile(
                  leading: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Palette.pinkDark.withOpacity(0.3),
                      ),
                      const Icon(
                        Icons.work_history_rounded,
                        size: 20,
                        color: Palette.red,
                      ),
                    ],
                  ),
                  minLeadingWidth: 0.0,
                  title: Text(
                    "Riwayat",
                    style: kTextTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Palette.black,
                    size: 24.0,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              InkWellContainer(
                onTap: () {
                  Get.toNamed('/change-password-dosen');
                },
                padding: const EdgeInsets.symmetric(vertical: 6),
                color: Colors.white,
                radius: 8.0,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
                child: ListTile(
                  leading: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Palette.pinkDark.withOpacity(0.3),
                      ),
                      const Icon(
                        Icons.lock,
                        size: 20,
                        color: Palette.red,
                      ),
                    ],
                  ),
                  minLeadingWidth: 0.0,
                  title: Text(
                    "Ganti Password",
                    style: kTextTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Palette.black,
                    size: 24.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
