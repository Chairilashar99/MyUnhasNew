import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/controllers/jadwal_mhs_controllers.dart';
import 'package:my_unhas_new/models/krs_mhs.dart';
import 'package:my_unhas_new/pages/widgets/schedule_card.dart';

class JadwalpageMahasiswa extends StatefulWidget {
  const JadwalpageMahasiswa({Key? key}) : super(key: key);

  @override
  State<JadwalpageMahasiswa> createState() => _JadwalpageMahasiswaState();
}

class _JadwalpageMahasiswaState extends State<JadwalpageMahasiswa> {
  final JadwalMahasiswaController controller =
      Get.put(JadwalMahasiswaController());
  int selectedDayIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: RichText(
                  text: TextSpan(
                    style: kTextTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Jadwal Matakuliah | ',
                        style: kTextTheme.titleSmall?.copyWith(
                          color: Palette.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Semester 7',
                        style: kTextTheme.titleSmall?.copyWith(
                          color: Palette.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 40,
                child: Obx(
                  () {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.jadwalMatakuliah.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedDayIndex = index;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                              left: 10,
                              right: index ==
                                      controller.jadwalMatakuliah.length - 1
                                  ? 10
                                  : 0,
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                              color: index == selectedDayIndex
                                  ? Palette.pinkDark.withOpacity(0.3)
                                  : Palette.white,
                              borderRadius: BorderRadius.circular(12),
                              border: index == selectedDayIndex
                                  ? null
                                  : Border.all(color: Palette.black),
                            ),
                            child: Text(
                              controller.jadwalMatakuliah[index],
                              style: TextStyle(
                                color: index == selectedDayIndex
                                    ? Palette.red
                                    : Palette.black,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(
                () {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Palette.red,
                      ),
                    );
                  }
                  final List<KelasKuliah>? kelasKuliahs =
                      controller.krsModel.value?.kartuRencanaStudi.kelasKuliahs;
                  return Column(
                    children: _buildScheduleCards(kelasKuliahs),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildScheduleCards(List<KelasKuliah>? kelasKuliahs) {
    if (kelasKuliahs != null && kelasKuliahs.isNotEmpty) {
      final filteredKelas = kelasKuliahs.where((kelas) => kelas.jadwalKuliahs
          .any((jadwal) => jadwal.dayOfWeek == selectedDayIndex + 1));

      if (filteredKelas.isNotEmpty) {
        return filteredKelas
            .map((kelas) => Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ScheduleCard(
                    title: kelas.mataKuliah.namaResmi,
                    time: _buildClassSchedule(kelas.jadwalKuliahs),
                    code: kelas.mataKuliah.kode,
                    subtitle: kelas.jadwalKuliahs[0].ruang.nama,
                    label: kelas.mataKuliah.mataKuliahSifat.nama,
                  ),
                ))
            .toList();
      }
    }

    return [
      const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No schedule available',
              style: TextStyle(color: Palette.red),
            ),
          ],
        ),
      )
    ];
  }

  String _buildClassSchedule(List<JadwalKuliah> schedules) {
    if (schedules.isNotEmpty) {
      final startTime = schedules[0].startTime;
      final endTime = schedules[schedules.length - 1].endTime;
      return '$startTime - $endTime';
    }
    return 'No Schedule';
  }
}
