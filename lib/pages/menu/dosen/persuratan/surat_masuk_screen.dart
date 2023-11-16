import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/pages/home/dosen/pages/persuratanpage_dosen.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/detail_profile_app_bar.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/filter_bottom_sheet.dart';

class SuratMasukScreen extends StatefulWidget {
  const SuratMasukScreen({super.key});

  @override
  State<SuratMasukScreen> createState() => _SuratMasukScreenState();
}

class _SuratMasukScreenState extends State<SuratMasukScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppBar(
        title: 'Surat Masuk',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 21, horizontal: 26),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Palette.white,
                          hintText: 'Search',
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 8),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.grey),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Palette.pink,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          errorStyle: const TextStyle(height: 1),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.red),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Palette.red),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                            ),
                            child: Container(
                              height: 35,
                              width: 35,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Palette.red,
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.search,
                                  size: 18,
                                  color: Palette.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.0),
                            ),
                          ),
                          builder: (context) {
                            return const FilterBottomSheet(
                                isDaftarKegiatan: false);
                          },
                        );
                      },
                      child: const Icon(
                        Icons.filter_list,
                        color: Palette.red,
                        size: 32,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 6,
                color: Palette.grey.withOpacity(.3),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 26,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              'September',
                              style: kTextTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Text(
                              '2 Surat',
                              style: kTextTheme.bodySmall,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    ListView.separated(
                      shrinkWrap: true,
                      controller: ScrollController(keepScrollOffset: false),
                      itemBuilder: (context, index) {
                        return const PersuratanCard(
                          title:
                              'Surat Penugasan Tim Penguji Ujian Sarjana a.n. Nurfadiah Azis L051181305',
                          numSurat: '10019/UN4.15.1/TD.06/2022',
                          tglSurat: '10-08-2023',
                          from: 'Fakultas Ilmu Kelautan dan Perikanan',
                          type: 'Internal Pribadi',
                          status: 'Belum Dibaca',
                          isDaftarKegiatan: false,
                        );
                      },
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 12),
                      itemCount: 2,
                    )
                  ],
                ),
              ),
              Divider(
                thickness: 6,
                color: Palette.grey.withOpacity(.3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
