import 'dart:convert';
import 'package:get/get.dart';
import 'package:my_unhas_new/models/indeks_prestasi_mhs.dart';
import 'package:my_unhas_new/models/khs_mhs.dart';
import 'package:my_unhas_new/models/profile_mhs.dart';
import 'package:my_unhas_new/models/semester_mhs.dart';
import 'package:my_unhas_new/models/transkrip_mhs.dart';
import 'package:my_unhas_new/services/indeks_prestasi_mhs_service.dart';
import 'package:my_unhas_new/services/khs_mhs_service.dart';
import 'package:my_unhas_new/services/profile_mhs_service.dart';
import 'package:my_unhas_new/services/semester_service.dart';
import 'package:my_unhas_new/services/transkrip_service.dart';
import 'package:my_unhas_new/utils/utility.dart';

class GrafikpageMahasiswaController extends GetxController {
  Rx<CurrentIndeksPrestasi?> indeksPrestasi = Rx<CurrentIndeksPrestasi?>(null);
  Rx<KhsModel?> khsModel = Rx<KhsModel?>(null);
  Rx<SemesterModel?> semesterModel = Rx<SemesterModel?>(null);
  Rx<ProfileMahasiswaModel?> profileMahasiswa =
      Rx<ProfileMahasiswaModel?>(null);
  Rx<TranskripModel?> transkripModel = Rx<TranskripModel?>(null);
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchIndeksPrestasi();
    fetchKhs();
    fetchSemester();
    fetchProfileData();
    fetchTranskripData();
  }

  Future<void> fetchIndeksPrestasi() async {
    try {
      isLoading.value = true;
      final response = await CurrentIndeksPrestasiService().getIndeksPrestasi();

      if (response.statusCode == 401 || response.statusCode == 403) {
        logout();
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseBody =
            json.decode(response.body) as Map<String, dynamic>?;

        if (responseBody != null) {
          final data = CurrentIndeksPrestasi.fromJson(
              responseBody['currentIndeksPrestasi']);
          indeksPrestasi.value = data;
        } else {
          print('Response body is null');
        }
      } else {
        print(
            'Failed to load indeks prestasi data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchKhs() async {
    try {
      isLoading.value = true;
      final response = await KhsService().getKhs();

      // print('Response status code: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 401 || response.statusCode == 403) {
        logout();
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseBody = json.decode(response.body);

        if (responseBody != null) {
          final data = KhsModel.fromJson(responseBody);
          khsModel.value = data;
        } else {
          print('Body respons null');
        }
      } else {
        print('Gagal memuat data KHS. Kode Status: ${response.statusCode}');
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
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchTranskripData() async {
    try {
      isLoading.value = true;
      final response = await TranskripService().getTranskrip();
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 401 || response.statusCode == 403) {
        logout();
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseBody =
            json.decode(response.body) as Map<String, dynamic>?;

        if (responseBody != null) {
          final data = TranskripModel.fromJson(responseBody);
          transkripModel.value = data;
        } else {
          print('Response body is null');
        }
      } else {
        print(
            'Failed to load transkrip data. Status Code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    } finally {
      isLoading.value = false;
    }
  }
}
