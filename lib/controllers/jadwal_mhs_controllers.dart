import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_unhas_new/models/krs_mhs.dart';
import 'package:my_unhas_new/models/profile_mhs.dart';
import 'package:my_unhas_new/models/semester_mhs.dart';
import 'package:my_unhas_new/services/krs_mhs_service.dart';
import 'package:my_unhas_new/services/profile_mhs_service.dart';
import 'package:my_unhas_new/services/semester_service.dart';
import 'package:my_unhas_new/utils/utility.dart';

class JadwalMahasiswaController extends GetxController {
  Rx<KrsModel?> krsModel = Rx<KrsModel?>(null);
  Rx<SemesterModel?> semesterModel = Rx<SemesterModel?>(null);
  Rx<ProfileMahasiswaModel?> profileMahasiswa =
      Rx<ProfileMahasiswaModel?>(null);
  RxBool isLoading = true.obs;
  final RxInt selectedCategoryIndex = 0.obs;
  final RxList<String> jadwalMatakuliah = <String>[
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jumat",
  ].obs;

  void updateSelectedCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
    fetchSemester();
    fetchProfileData();
  }

  void fetchDataForSelectedSemester(String idSemester) {
    fetchKrs(idSemester: idSemester);
  }

  Future<void> fetchKrs({required String idSemester}) async {
    try {
      isLoading.value = true;
      final response = await KrsService().getKrs({'id_semester': idSemester});
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 401 || response.statusCode == 403) {
        logout();
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseBody = json.decode(response.body);

        if (responseBody != null) {
          print('Response body is not null');
          final data = KrsModel.fromJson(responseBody);
          krsModel.value = data;
          print('KrsModel data: $data');

          if (krsModel.value != null) {
            print('Data sudah ada untuk semester dengan id: $idSemester');
          } else {
            print('Data belum ada untuk semester dengan id: $idSemester');
          }
        } else {
          print('Body respons null');
        }
      } else {
        print('Gagal memuat data KRS. Kode Status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchSemester() async {
    try {
      isLoading.value = true;
      final response = await SemesterService().getSemester();

      if (response.statusCode == 401 || response.statusCode == 403) {
        logout();
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseBody = json.decode(response.body);

        if (responseBody != null) {
          final data = SemesterModel.fromJson(responseBody);
          semesterModel.value = data;

          if (semesterModel.value != null &&
              semesterModel.value!.semesters.isNotEmpty) {
            String idSemester = semesterModel.value!.semesters[0].id.toString();
            print('ID Semester: $idSemester');

            fetchDataForSelectedSemester(idSemester);
          } else {
            print('Data semester tidak lengkap');
          }
        } else {
          print('Response body is null');
        }
      } else {
        print(
            'Gagal memuat data semester. Kode Status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchProfileData() async {
    try {
      isLoading.value = true;
      final response = await ProfileMahasiswaSevice().getProfile();

      if (response.statusCode == 401 || response.statusCode == 403) {
        logout();
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseBody =
            json.decode(response.body) as Map<String, dynamic>?;

        if (responseBody != null) {
          final data =
              ProfileMahasiswaModel.fromJson(responseBody['mahasiswa']);
          profileMahasiswa.value = data;
        } else {
          print('Response body is null');
        }
      } else {
        print('Gagal memuat data profil. Kode Status: ${response.statusCode}');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
