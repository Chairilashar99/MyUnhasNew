import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/pages/menu/mahasiswa/profile/widgets/detail_profile_app_bar.dart';

class FormPersonalDataDosen extends StatefulWidget {
  const FormPersonalDataDosen({super.key});

  @override
  State<FormPersonalDataDosen> createState() => _FormPersonalDataDosenState();
}

class _FormPersonalDataDosenState extends State<FormPersonalDataDosen> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MenuAppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.close,
          ),
        ),
        title: 'Tambah Data',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hubungan",
                        style: TextStyle(
                          color: Palette.black,
                        ),
                      ),
                      buildFieldPersonalData(
                          'hubungan', 'Harap isi hubungan terlebih dahulu'),
                      const Text(
                        "Nama Pasangan",
                        style: TextStyle(
                          color: Palette.black,
                        ),
                      ),
                      buildFieldPersonalData('pasangan',
                          'Harap isi nama pasangan terlebih dahulu'),
                      const Text(
                        "Nomor KTP",
                        style: TextStyle(
                          color: Palette.black,
                        ),
                      ),
                      buildFieldPersonalData(
                          'ktp', 'Harap isi nomor ktp terlebih dahulu'),
                      const Text(
                        "Tempat Lahir",
                        style: TextStyle(
                          color: Palette.black,
                        ),
                      ),
                      buildFieldPersonalData('tempatlahir',
                          'Harap isi nama tempat lahir terlebih dahulu'),
                      const Text(
                        "Tanggal Lahir",
                        style: TextStyle(
                          color: Palette.black,
                        ),
                      ),
                      buildFieldPersonalData('tanggallahir',
                          'Harap isi nama tanggal lahir terlebih dahulu'),
                      const Text(
                        "Pendidikan",
                        style: TextStyle(
                          color: Palette.black,
                        ),
                      ),
                      buildFieldPersonalData('pendidikan',
                          'Harap isi nama pendidikan terlebih dahulu'),
                      const Text(
                        "Tanggal Menikah",
                        style: TextStyle(
                          color: Palette.black,
                        ),
                      ),
                      buildFieldPersonalData('tanggalmenikah',
                          'Harap isi nama pasangan terlebih dahulu'),
                      const Text(
                        "Pekerjaan",
                        style: TextStyle(
                          color: Palette.black,
                        ),
                      ),
                      buildFieldPersonalData('pekerjaan',
                          'Harap isi nama pekerjaan terlebih dahulu'),
                      const Text(
                        "NPWP",
                        style: TextStyle(
                          color: Palette.black,
                        ),
                      ),
                      buildFieldPersonalData(
                          'npwp', 'Harap isi npwp terlebih dahulu'),
                      const Text(
                        "Penerima Tunjangan",
                        style: TextStyle(
                          color: Palette.black,
                        ),
                      ),
                      buildFieldPersonalData('tunjangan',
                          'Harap isi penerima tunjangan terlebih dahulu'),
                      const Text(
                        "Status Pasangan",
                        style: TextStyle(
                          color: Palette.black,
                        ),
                      ),
                      buildFieldPersonalData('status',
                          'Harap isi status pasangan terlebih dahulu'),
                      const Text(
                        "Catatan",
                        style: TextStyle(
                          color: Palette.black,
                        ),
                      ),
                      buildFieldPersonalData(
                          'catatan', 'Harap isi catatan terlebih dahulu'),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Palette.red,
                          minimumSize: const Size(double.infinity, 56),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                        ),
                        icon: const Icon(
                          Icons.arrow_forward_rounded,
                          color: Palette.white,
                          size: 18,
                        ),
                        label: const Text(
                          'Submit',
                          style: TextStyle(color: Palette.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildFieldPersonalData(String name, String errorText) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16),
      child: FormBuilderTextField(
        name: name,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(
            errorText: errorText,
          ),
        ]),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.grey),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Palette.pink,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          errorStyle: const TextStyle(height: 1),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.red),
            borderRadius: BorderRadius.circular(16.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Palette.red),
            borderRadius: BorderRadius.circular(16.0),
          ),
        ),
      ),
    );
  }
}
