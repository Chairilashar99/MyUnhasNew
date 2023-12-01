import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_unhas_new/constants/asset_path.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/controllers/grafik_mhs_controllers.dart';
import 'package:my_unhas_new/models/khs_mhs.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MahasiswaDetail {
  final String label;
  final String value;

  MahasiswaDetail(this.label, this.value);
}

class SemesterData {
  final String semester;
  final double nilai;

  SemesterData(this.semester, this.nilai);
}

class GrafikPageWali extends StatefulWidget {
  const GrafikPageWali({Key? key}) : super(key: key);

  @override
  _GrafikPageWaliState createState() => _GrafikPageWaliState();
}

class _GrafikPageWaliState extends State<GrafikPageWali> {
  late GrafikpageMahasiswaController controller;

  @override
  void initState() {
    super.initState();
    controller = Get.put(GrafikpageMahasiswaController());
  }

  String hitungSemester(int? tahun, int? semesterTahunAjaran) {
    late int semesterValue;

    final angaktanMahasiswa = controller.profileMahasiswa.value?.angkatan;

    if (angaktanMahasiswa != null) {
      semesterValue = (tahun! - angaktanMahasiswa) * 2 + semesterTahunAjaran!;
    }

    return "Semester $semesterValue";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Obx(() {
          return SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ExpansionTile(
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                        "https://i.ibb.co/PGv8ZzG/me.jpg",
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        Obx(() {
                          final name = controller.profileMahasiswa.value;

                          return Text(
                            name?.namaMahasiswa ?? '',
                            style: kTextTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: Palette.black,
                              height: 1.2,
                            ),
                          );
                        }),
                        const SizedBox(height: 8),
                        Obx(() {
                          final semesters =
                              controller.semesterModel.value?.semesters;
                          final mahasiswa =
                              controller.profileMahasiswa.value?.angkatan;

                          if (semesters != null && mahasiswa != null) {
                            final currentSemester = semesters[0].tahun is int
                                ? semesters[0].tahun
                                : int.parse(semesters[0].tahun.toString());
                            final angkatan = int.parse(mahasiswa.toString());
                            final sisaSemester =
                                int.parse(semesters[0].kode.substring(4, 5));

                            final semesterValue =
                                (currentSemester.toInt() - angkatan.toInt()) *
                                        2 +
                                    1 +
                                    sisaSemester.toInt();
                            print(
                                'currentSemester: $currentSemester, angkatan: $angkatan, sisaSemester: $sisaSemester');
                            print('semesterValue: $semesterValue');

                            return Text(
                              "Semester $semesterValue",
                              style: kTextTheme.bodyMedium?.copyWith(
                                color: Palette.red,
                                height: 1,
                              ),
                            );
                          } else {
                            return const Text(
                              "-",
                              style: TextStyle(
                                color: Palette.red,
                              ),
                            );
                          }
                        }),
                        const SizedBox(height: 16),
                      ],
                    ),
                    iconColor: Palette.red,
                    children: controller.transkripModel.value != null
                        ? [
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "NIM:",
                                    style: kTextTheme.bodyMedium,
                                  ),
                                  Text(
                                    controller
                                            .transkripModel.value!.mahasiswa.nim
                                            .toString() ??
                                        '-',
                                    style: kTextTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Palette.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Program Studi:",
                                    style: kTextTheme.bodyMedium,
                                  ),
                                  Text(
                                    controller.transkripModel.value!.mahasiswa
                                            .prodi.namaResmi ??
                                        '-',
                                    style: kTextTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Palette.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total SKS:",
                                    style: kTextTheme.bodyMedium,
                                  ),
                                  Text(
                                    '${controller.transkripModel.value?.transkrip.fold<int>(0, (prev, matakuliah) => prev + matakuliah.sks) ?? "-"}',
                                    style: kTextTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Palette.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Mata Kuliah:",
                                    style: kTextTheme.bodyMedium,
                                  ),
                                  Text(
                                    controller.transkripModel.value!.transkrip
                                            ?.length
                                            .toString() ??
                                        '-',
                                    style: kTextTheme.bodyMedium?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: Palette.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]
                        : [],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 1.0 / 0.7,
                    crossAxisCount: 2,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                  ),
                  itemCount: 2,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Obx(() {
                      final indeksPrestasiData =
                          controller.indeksPrestasi.value;

                      return Container(
                        decoration: BoxDecoration(
                          color: Palette.red,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(16),
                                ),
                                child: SvgPicture.asset(
                                  AssetPath.getVector('ellipse_2.svg'),
                                ),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              top: 0,
                              child: SvgPicture.asset(
                                AssetPath.getVector('ellipse_1.svg'),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 0,
                              right: 0,
                              child: Column(
                                children: [
                                  Text(
                                    index == 0
                                        ? "Indeks Prestasi Kumulatif"
                                        : "Indeks Prestasi Semester",
                                    textAlign: TextAlign.center,
                                    style: kTextTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: Palette.white,
                                      letterSpacing: 2.0,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                      const SizedBox(width: 9),
                                      Text(
                                        index == 0
                                            ? indeksPrestasiData
                                                    ?.indeksPrestasiKumulatif ??
                                                '-'
                                            : indeksPrestasiData
                                                    ?.indeksPrestasiSemester ??
                                                '-',
                                        style:
                                            kTextTheme.headlineMedium?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                ListTile(
                  title: Text(
                    "Grafik Nilai",
                    style: kTextTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Palette.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() {
                  final khsData = controller.khsModel.value;
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Palette.red,
                      ),
                    );
                  }
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 2,
                      child: SfCartesianChart(
                        primaryXAxis: CategoryAxis(),
                        primaryYAxis: NumericAxis(
                          minimum: 0.50,
                          maximum: 4.00,
                          interval: 0.50,
                        ),
                        series: <ChartSeries>[
                          ColumnSeries<IndeksPrestasi, String>(
                            dataSource: khsData?.indeksPrestasis ?? [],
                            xValueMapper: (IndeksPrestasi data, _) =>
                                hitungSemester(
                                    data.tahun, data.semesterTahunAjaran),
                            yValueMapper: (IndeksPrestasi data, _) =>
                                double.parse(
                                    data.indeksPrestasiSemester ?? '0.0'),
                            dataLabelSettings: const DataLabelSettings(
                              isVisible: true,
                              labelAlignment: ChartDataLabelAlignment.middle,
                            ),
                            color: Palette.red,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ],
            ),
          );
        }),
      ),
    );
  }
}
