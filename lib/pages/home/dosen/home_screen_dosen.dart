import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_unhas_new/constants/asset_path.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/pages/home/dosen/pages/homepage_dosen.dart';
import 'package:my_unhas_new/pages/home/dosen/pages/kalenderpage_dosen.dart';
import 'package:my_unhas_new/pages/home/dosen/pages/profilepage_dosen.dart';
import 'package:my_unhas_new/pages/widgets/custom_navigation_bar.dart';
import 'package:my_unhas_new/pages/widgets/logout_modal.dart';
import 'package:my_unhas_new/pages/widgets/myunhas_appbar.dart';
import 'pages/jadwalpage_mahasiswa.dart';

class HomescreenDosen extends StatefulWidget {
  const HomescreenDosen({super.key});

  @override
  State<HomescreenDosen> createState() => _HomescreenDosenState();
}

class _HomescreenDosenState extends State<HomescreenDosen> {
  final ValueNotifier<int> _selectedIndex = ValueNotifier(0);

  final pages = [
    const HomePageDosen(),
    const KalenderDosen(),
    const JadwalPageDosen(),
    const ProfilePageDosen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _selectedIndex,
      builder: (context, value, _) {
        return Scaffold(
          backgroundColor: Palette.white,
          appBar: value == 3
              ? AppBar(
                  systemOverlayStyle: const SystemUiOverlayStyle(
                      systemNavigationBarColor: Palette.red,
                      statusBarColor: Colors.transparent),
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  leadingWidth: 250,
                  leading: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(width: 12),
                      Image.asset(
                        AssetPath.getImage('logo-merah.png'),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          'My',
                          style: kTextTheme.headlineMedium?.copyWith(
                            color: Palette.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          'Unhas',
                          style: kTextTheme.headlineMedium?.copyWith(
                            color: Palette.red,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  actions: [
                    InkWell(
                      onTap: () {
                        showGeneralDialog(
                          context: context,
                          barrierDismissible: true,
                          transitionDuration: const Duration(
                            milliseconds: 400,
                          ),
                          transitionBuilder:
                              (context, animation, secondaryAnimation, child) {
                            Tween<Offset> tween;
                            tween = Tween(
                                begin: const Offset(0, -1), end: Offset.zero);
                            return SlideTransition(
                              position: tween.animate(
                                CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.easeInOut,
                                ),
                              ),
                              child: child,
                            );
                          },
                          barrierLabel: 'Keluar',
                          pageBuilder: (context, _, __) {
                            return const LogoutModal();
                          },
                        );
                      },
                      child: const Icon(
                        Icons.logout,
                        color: Palette.red,
                      ),
                    ),
                    const SizedBox(width: 8)
                  ],
                )
              : const MyUnhasAppBar(),
          body: pages[value],
          bottomNavigationBar: CustomNavigationBar(
            value: value,
            listIcons: const [
              Iconsax.home5,
              Iconsax.calendar5,
              Iconsax.note_add5,
              Iconsax.personalcard5,
            ],
            listTitle: const [
              'Home',
              'Kalender',
              'Jadwal Mengajar',
              'Profile',
            ],
            selectedIndex: _selectedIndex,
          ),
        );
      },
    );
  }
}
