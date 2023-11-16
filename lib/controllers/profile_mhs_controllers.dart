import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_unhas_new/models/profile_mhs.dart';
import 'package:my_unhas_new/services/profile_mhs_service.dart';
import 'package:my_unhas_new/utils/utility.dart';

class ProfileMahasiswaController extends GetxController {
  Rx<ProfileMahasiswaModel?> profileMahasiswa =
      Rx<ProfileMahasiswaModel?>(null);
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProfileData();
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
