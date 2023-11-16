import 'dart:convert';

import 'package:get/get.dart';
import 'package:my_unhas_new/models/indeks_prestasi_mhs.dart';
import 'package:my_unhas_new/models/khs_mhs.dart';
import 'package:my_unhas_new/services/indeks_prestasi_mhs_service.dart';
import 'package:my_unhas_new/services/khs_mhs_service.dart';
import 'package:my_unhas_new/utils/utility.dart';

class GrafikpageMahasiswaController extends GetxController {
  Rx<CurrentIndeksPrestasi?> indeksPrestasi = Rx<CurrentIndeksPrestasi?>(null);
  Rx<KhsModel?> khsModel = Rx<KhsModel?>(null);
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchIndeksPrestasi();
    fetchKhs();
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

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 401 || response.statusCode == 403) {
        logout();
      }

      if (response.statusCode == 200) {
        final Map<String, dynamic>? responseBody = json.decode(response.body);

        if (responseBody != null) {
          print('Response body is not null');
          final data = KhsModel.fromJson(responseBody);
          khsModel.value = data;
          print('KhsModel data: $data');
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
}
