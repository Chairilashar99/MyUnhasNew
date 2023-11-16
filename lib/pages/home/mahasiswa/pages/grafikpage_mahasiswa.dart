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

class GrafikpageMahasiswa extends StatefulWidget {
  GrafikpageMahasiswa({Key? key}) : super(key: key);

  @override
  _GrafikpageMahasiswaState createState() => _GrafikpageMahasiswaState();
}

class _GrafikpageMahasiswaState extends State<GrafikpageMahasiswa> {
  final GrafikpageMahasiswaController controller =
      Get.put(GrafikpageMahasiswaController());

  List<MahasiswaDetail> details = [
    MahasiswaDetail("NIM:", "12345678"),
    MahasiswaDetail("Program Studi:", "Teknik Informatika"),
    MahasiswaDetail("Total SKS:", "120"),
    MahasiswaDetail("Total Mata Kuliah:", "40"),
  ];

  // List<SemesterData> semesterData = [
  //   SemesterData('Semester 1', 3.5),
  //   SemesterData('Semester 2', 3.7),
  //   SemesterData('Semester 3', 3.2),
  //   SemesterData('Semester 4', 3.8),
  //   SemesterData('Semester 5', 3.6),
  //   SemesterData('Semester 6', 3.9),
  //   SemesterData('Semester 7', 3.4),
  // ];

  @override
  Widget build(BuildContext context) {
    // final khsData = controller.khsModel.value;
    // print('Indeks Prestasi Data: ${khsData?.indeksPrestasis}');
    // if (controller.isLoading.value) {
    //   return Center(
    //     child: CircularProgressIndicator(),
    //   );
    // }

    // if (khsData == null) {
    //   // Tampilkan widget alternatif atau penanganan yang sesuai
    //   return Text('Data KHS tidak tersedia');
    // }
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
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
                      Text(
                        "Andi Ilhamsyah Idris",
                        style: kTextTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Palette.black,
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Semester 7",
                        style: kTextTheme.bodyMedium?.copyWith(
                          color: Palette.red,
                          height: 1,
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                  iconColor: Palette.red,
                  children: details.map((detail) {
                    return ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            detail.label,
                            style: kTextTheme.bodyMedium,
                          ),
                          Text(
                            detail.value,
                            style: kTextTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                              color: Palette.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
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
                    final indeksPrestasiData = controller.indeksPrestasi.value;

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
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: SizedBox(
              //     width: MediaQuery.of(context).size.width * 2,
              //     child: SfCartesianChart(
              //       primaryXAxis: CategoryAxis(
              //         minimum: 0.0,
              //         maximum: 10.0,
              //       ),
              //       primaryYAxis: NumericAxis(
              //         minimum: 0.50,
              //         maximum: 4.00,
              //         interval: 0.50,
              //       ),
              //       series: <ChartSeries>[
              //         ColumnSeries<IndeksPrestasi, String>(
              //           dataSource: khsData?.indeksPrestasis ?? [],
              //           xValueMapper: (IndeksPrestasi data, _) =>
              //               '${data.tahun} ${data.semesterTahunAjaran}',
              //           yValueMapper: (IndeksPrestasi data, _) =>
              //               double.parse(data.indeksPrestasiSemester ?? '0.0'),
              //           dataLabelSettings: const DataLabelSettings(
              //             isVisible: true,
              //             labelAlignment: ChartDataLabelAlignment.middle,
              //           ),
              //           color: Palette.red,
              //         ),
              //       ],
              //     ),
              //   ),
              // )
              Obx(() {
                final khsData = controller.khsModel.value;
                if (controller.isLoading.value) {
                  return Center(
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
                              '${data.tahun} ${data.semesterTahunAjaran}',
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
        ),
      ),
    );
  }
}

//Null check operator used on a null