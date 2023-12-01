import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_unhas_new/constants/asset_path.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/controllers/profile_mhs_controllers.dart';
import 'package:my_unhas_new/pages/widgets/pdf_viewer.dart';
import 'package:my_unhas_new/utils/utility.dart';

class HomepageWali extends StatelessWidget {
  final ProfileMahasiswaController controller =
      Get.put(ProfileMahasiswaController());

  HomepageWali({Key? key}) : super(key: key);

  Future<void> _onRefresh() async {
    controller.updateSemesterValue();
  }

  void _showPdfViewer(BuildContext context) {
    Get.to(() => PdfViewerPage(pdfAssetPath: 'assets/panduan.pdf'));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Obx(() {
          final profileData = controller.profileMahasiswa.value;
          final semesters = controller.semesterModel.value?.semesters;
          final semesterValue = controller.semesterValue;

          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(
                color: Palette.red,
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: _onRefresh,
            displacement: 20,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      getGreeting(),
                      style: kTextTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      profileData?.namaMahasiswa ?? '',
                      style: kTextTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Palette.red,
                        height: 1.2,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    child: Text(
                      'Selamat datang di Aplikasi MyUnhas. MyUnhas adalah sistem yang memungkinkan civitas akademika Universitas Hasanuddin menerima informasi lebih cepat melalui internet.',
                      style: kTextTheme.bodySmall,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 18),
                    width: MediaQuery.of(context).size.width - 28,
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 30,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                'Semester',
                                style: TextStyle(color: Palette.white),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                getPeriod(),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: kTextTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18,
                                  color: Palette.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      controller: ScrollController(keepScrollOffset: false),
                      itemBuilder: (context, index) {
                        final pembayaranData =
                            controller.pembayaranModel.value?.pembayaran;
                        final statusPembayaran =
                            controller.pembayaranModel.value?.status;

                        if (semesters != null && semesterValue != null) {
                          final displayIndex = index + 1;
                          return Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ListTile(
                              title: Text(
                                "Semester $displayIndex",
                                style: kTextTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Palette.black,
                                  height: 1.2,
                                ),
                              ),
                              subtitle: Text(
                                'Rp. ${pembayaranData?.nominal ?? '-'}',
                                style: kTextTheme.bodyMedium,
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.verified,
                                    color: Palette.red,
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    statusPembayaran ?? '',
                                    style: kTextTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return SizedBox.shrink();
                        }
                      },
                      itemCount: controller.semesterValue?.length ?? 0,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Flexible(
                    child: Text(
                      'Panduan MyUnhas',
                      style: kTextTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Flexible(
                    child: Text(
                      'Panduan pemakaian MyUnhas berisi infomasi seputar cara penggunaan MyUnhas bagi pengguna.',
                      style: kTextTheme.bodySmall,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 15.0,
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        _showPdfViewer(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Palette.white,
                        minimumSize: const Size(double.infinity, 56),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25),
                          ),
                        ),
                        elevation: 4,
                        shadowColor: Palette.black.withOpacity(.5),
                      ),
                      icon: const Icon(
                        Icons.difference_outlined,
                        color: Palette.black,
                        size: 18,
                      ),
                      label: const Text(
                        'Lihat Panduan',
                        style: TextStyle(color: Palette.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
