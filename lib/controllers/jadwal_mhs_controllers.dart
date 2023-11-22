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
    fetchKrs();
    fetchSemester();
    fetchProfileData();
  }

  Future<void> fetchKrs() async {
    try {
      isLoading.value = true;
      final response = await KrsService().getKrs();

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
        } else {
          print('Response body is null');
        }
      } else {
        print(
            'Failed to load semester data. Status Code: ${response.statusCode}');
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
        print(
            'Failed to load profile data. Status Code: ${response.statusCode}');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
