import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/pages/menu/dosen/profile/widgets/title_riwayat.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/change_photo_sheet.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/detail_profile_app_bar.dart';

class PersonalDataScreenDosen extends StatelessWidget {
  const PersonalDataScreenDosen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppBar(title: 'Data Pribadi'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Stack(
                children: <Widget>[
                  InkWell(
                    onTap: () => showModalBottomSheet(
                      context: context,
                      builder: (ctx) => ChangePhotoProfileSheet(
                          onTap: () {}, isPhotoProfileExist: true),
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      foregroundImage: NetworkImage(
                        'https://i.ibb.co/PGv8ZzG/me.jpg',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Palette.red,
                        shape: BoxShape.circle,
                        border: Border.all(color: Palette.white),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.photo_camera_rounded,
                          color: Palette.white,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TitleRiwayat(
              item: Container(),
              title: 'Profile Prof. Dr. Ir. Achmar Mallawa, DEA.',
            ),
            TitleRiwayat(
              item: Container(),
              title: 'Biodata',
            ),
            TitleRiwayat(
              item: Container(),
              title: 'Data Pasangan',
            ),
            TitleRiwayat(
              item: Container(),
              title: 'Data Anak',
            ),
            TitleRiwayat(
              item: Container(),
              title: 'Data Orang Tua',
            ),
            TitleRiwayat(
              item: Container(),
              title: 'Data Mertua',
            ),
            TitleRiwayat(
              item: Container(),
              title: 'Data Saudara Kandung',
            )
          ],
        ),
      ),
    );
  }
}
