import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/controllers/profile_mhs_controllers.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/change_photo_sheet.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/detail_profile_app_bar.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/personal_data_form.dart';

class PersonalDataScreen extends StatelessWidget {
  final ProfileMahasiswaController controller =
      Get.put(ProfileMahasiswaController());

  PersonalDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MenuAppBar(
        title: 'Data Pribadi',
      ),
      body: Obx(
        () {
          if (controller.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(
                color: Palette.red,
              ),
            );
          }

          final profileData = controller.profileMahasiswa.value;

          return SingleChildScrollView(
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
                const SizedBox(height: 16),
                PersonalDataForm(
                  title: 'Profile ${profileData?.namaMahasiswa ?? ""}',
                  dataMap: {
                    'Nama': profileData?.namaMahasiswa ?? "",
                    'NIM': profileData?.nim ?? "",
                    'Program Studi': profileData?.prodi?.namaResmi ?? "",
                    'Semester': 'Semester Awal Tahun Akademik 2023/2024',
                  },
                ),
                PersonalDataForm(
                  title: 'Biodata',
                  dataMap: {
                    'Nomor Induk Kependudukan': profileData?.nik ?? "",
                    'NISN': profileData?.nisn ?? "",
                    'Nomor Handphone': profileData?.handphone ?? "",
                    'Email': profileData?.email ?? "",
                    'Tempat & Tanggal Lahir':
                        '${profileData?.tempatLahir ?? ""}, ${profileData?.tanggalLahir ?? ""}',
                    'Alamat Domisili': profileData?.jalan ?? "",
                    'Kode Pos': profileData?.kodePos ?? "",
                    'Kecamatan ID': profileData?.kelurahan ?? "",
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
