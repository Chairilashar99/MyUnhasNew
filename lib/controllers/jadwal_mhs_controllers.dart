import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_unhas_new/models/krs_mhs.dart';
import 'package:my_unhas_new/services/krs_mhs_service.dart';
import 'package:my_unhas_new/utils/utility.dart';

class JadwalMahasiswaController extends GetxController {
  Rx<KrsModel?> krsModel = Rx<KrsModel?>(null);
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
  }

  Future<void> fetchKrs() async {
    try {
      isLoading.value = true;
      final response = await KrsService().getKrs();

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
}
