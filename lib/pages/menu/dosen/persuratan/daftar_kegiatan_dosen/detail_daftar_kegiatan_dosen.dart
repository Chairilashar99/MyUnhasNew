import 'package:flutter/material.dart';
import 'package:my_unhas_new/pages/menu/dosen/profile/widgets/title_riwayat.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/detail_profile_app_bar.dart';
// import 'package:flutter_e_wali/src/presentation/features/menu/dosen/profile/widgets/title_riwayat.dart';
// import 'package:flutter_e_wali/src/presentation/features/menu/mahasiswa/profile/widgets/detail_profile_app_bar.dart';

class DetailDaftarKegiatanDosen extends StatefulWidget {
  const DetailDaftarKegiatanDosen({super.key});

  @override
  State<DetailDaftarKegiatanDosen> createState() =>
      _DetailDaftarKegiatanDosenState();
}

class _DetailDaftarKegiatanDosenState extends State<DetailDaftarKegiatanDosen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppBar(
        title: '44/UN4.15/KEP/2020',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleRiwayat(
                item: Container(),
                title: 'BKD/IK',
              ),
              TitleRiwayat(
                item: Container(),
                title: 'Detail Surat',
              ),
              TitleRiwayat(
                item: Container(),
                title: 'File Bukti Kegiatan',
              ),
              TitleRiwayat(
                item: Container(),
                title: 'Anggota Surat',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
