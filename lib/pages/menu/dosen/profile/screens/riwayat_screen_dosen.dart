import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/pages/menu/dosen/profile/widgets/title_riwayat.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/detail_profile_app_bar.dart';

class RiwayatScreenDosen extends StatefulWidget {
  const RiwayatScreenDosen({super.key});

  @override
  State<RiwayatScreenDosen> createState() => _RiwayatScreenDosenState();
}

class _RiwayatScreenDosenState extends State<RiwayatScreenDosen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppBar(
        title: 'Riwayat',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleRiwayat(
                item: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            'Sekolah:',
                            style: kTextTheme.bodySmall?.copyWith(
                              color: Palette.grey,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            ' Universitas Hasanuddin',
                            style: kTextTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            'Tahun Lulus:',
                            style: kTextTheme.bodySmall?.copyWith(
                              color: Palette.grey,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            ' 1999',
                            style: kTextTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 64,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Tempat:',
                                  style: kTextTheme.bodySmall?.copyWith(
                                    color: Palette.grey,
                                  ),
                                ),
                                Text(
                                  ' Makassar',
                                  style: kTextTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.delete_outline_rounded,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.edit_outlined,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                title: 'Riwayat Pendidikan',
              ),
              TitleRiwayat(
                item: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            'Sekolah:',
                            style: kTextTheme.bodySmall?.copyWith(
                              color: Palette.grey,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            ' Universitas Hasanuddin',
                            style: kTextTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            'Tahun Lulus:',
                            style: kTextTheme.bodySmall?.copyWith(
                              color: Palette.grey,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            ' 1999',
                            style: kTextTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 64,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Tempat:',
                                  style: kTextTheme.bodySmall?.copyWith(
                                    color: Palette.grey,
                                  ),
                                ),
                                Text(
                                  ' Makassar',
                                  style: kTextTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.delete_outline_rounded,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.edit_outlined,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                title: 'Riwayat Pelatihan',
              ),
              TitleRiwayat(
                item: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            'Sekolah:',
                            style: kTextTheme.bodySmall?.copyWith(
                              color: Palette.grey,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            ' Universitas Hasanuddin',
                            style: kTextTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            'Tahun Lulus:',
                            style: kTextTheme.bodySmall?.copyWith(
                              color: Palette.grey,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            ' 1999',
                            style: kTextTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 64,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Tempat:',
                                  style: kTextTheme.bodySmall?.copyWith(
                                    color: Palette.grey,
                                  ),
                                ),
                                Text(
                                  ' Makassar',
                                  style: kTextTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.delete_outline_rounded,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.edit_outlined,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                title: 'Riwayat Golongan',
              ),
              TitleRiwayat(
                item: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            'Sekolah:',
                            style: kTextTheme.bodySmall?.copyWith(
                              color: Palette.grey,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            ' Universitas Hasanuddin',
                            style: kTextTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            'Tahun Lulus:',
                            style: kTextTheme.bodySmall?.copyWith(
                              color: Palette.grey,
                            ),
                          ),
                        ),
                        Flexible(
                          child: Text(
                            ' 1999',
                            style: kTextTheme.bodyMedium,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 64,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Tempat:',
                                  style: kTextTheme.bodySmall?.copyWith(
                                    color: Palette.grey,
                                  ),
                                ),
                                Text(
                                  ' Makassar',
                                  style: kTextTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                          Flexible(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.delete_outline_rounded,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.edit_outlined,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                title: 'Riwayat Pengajaran',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
