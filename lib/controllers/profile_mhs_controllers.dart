import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_unhas_new/models/pembayaran_ewali.dart';
import 'package:my_unhas_new/models/profile_mhs.dart';
import 'package:my_unhas_new/models/semester_mhs.dart';
import 'package:my_unhas_new/services/pembayaran_service.dart';
import 'package:my_unhas_new/services/profile_mhs_service.dart';
import 'package:my_unhas_new/services/semester_service.dart';
import 'package:my_unhas_new/utils/utility.dart';

class ProfileMahasiswaController extends GetxController {
  Rx<ProfileMahasiswaModel?> profileMahasiswa =
      Rx<ProfileMahasiswaModel?>(null);
  Rx<PembayaranModel?> pembayaranModel = Rx<PembayaranModel?>(null);
  Rx<SemesterModel?> semesterModel = Rx<SemesterModel?>(null);

  RxList<int> semesterValue = <int>[].obs;
  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchProfileData();
    await fetchSemester();
    await fetchPembayaran();
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

  Future<void> fetchPembayaran() async {
    try {
      isLoading.value = true;
      final response = await PembayaranService().getPembayaran();

      if (response.statusCode == 401 || response.statusCode == 403) {
        logout();
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseBody = json.decode(response.body);

        if (responseBody != null) {
          final data = PembayaranModel.fromJson(responseBody);
          pembayaranModel.value = data;
        } else {
          print('Body respons null');
        }
      } else {
        print(
            'Gagal memuat data Pembayaran. Kode Status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchSemester() async {
    try {
      isLoading.value = true;
      final response = await SemesterService().getSemester();

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 401 || response.statusCode == 403) {
        logout();
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseBody = json.decode(response.body);

        if (responseBody != null) {
          final data = SemesterModel.fromJson(responseBody);
          semesterModel.value = data;
          print('Calling updateSemesterValue()');
          await updateSemesterValue();

          print('SemesterValue after update: ${semesterValue?.toList()}');
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

  Future<void> updateSemesterValue() async {
    final semesters = semesterModel.value?.semesters;
    final mahasiswa = profileMahasiswa.value?.angkatan;

    if (semesters != null && mahasiswa != null) {
      final currentSemester = semesters[0].tahun is int
          ? semesters[0].tahun
          : int.parse(semesters[0].tahun.toString());
      final angkatan = int.parse(mahasiswa.toString());
      final sisaSemester = int.parse(semesters[0].kode.substring(0, 4));

      final currentSemesterMinusOne = currentSemester - 1;
      final angkatans = angkatan;

      semesterValue(List.generate(
        semesters.length,
        (index) => currentSemesterMinusOne - angkatans * 2 + 1 + sisaSemester,
      ));
    }
  }
}
