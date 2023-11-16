import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/pages/widgets/inkwell_container.dart';

class PersuratanpageDosen extends StatelessWidget {
  const PersuratanpageDosen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final titles = [
                      "Insentif Kinerja",
                      "Beban Kinerja Dosen",
                      "Kewajiban Dosen",
                      "Forum Dosen/Tendik"
                    ];
                    return SizedBox(
                      width: (MediaQuery.of(context).size.width - (5 * 28)) / 4,
                      child: MenuCardPersuratanDosen(
                        title: titles[index],
                        onTap: () {
                          switch (titles[index]) {
                            case "Insentif Kinerja":
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => NeosiaPage()),
                              // );
                              break;
                            case "Beban Kinerja Dosen":
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => SikolaPage()),
                              // );
                              break;
                            default:
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => OtherPage()),
                              // );
                              break;
                          }
                        },
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 28),
                  itemCount: 4,
                ),
              ),
              const SizedBox(height: 60),
              TitlePersuratan(
                  title: 'Surat Masuk',
                  onTap: () {
                    // context.navigateTo(
                    //   AppRoute.suratMasukScreenDosen,
                    // );
                  }),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const PersuratanCard(
                      title:
                          'Surat Penugasan Tim Penguji Ujian Sarjana a.n. Nurfadiah Azis L051181305',
                      numSurat: '10019/UN4.15.1/TD.06/2022',
                      tglSurat: '10-08-2023',
                      from: 'Fakultas Ilmu Kelautan dan Perikanan',
                      type: 'Internal Pribadi',
                      status: 'Belum Dibaca',
                      isDaftarKegiatan: false,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemCount: 3,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TitlePersuratan(
                title: 'Daftar Kegiatan Dosen',
                onTap: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const PersuratanCard(
                      title:
                          'KEPUTUSAN DEKAN an. TIM TASK FORCE Reakreditasi Prodi S3 Ilmu Perikanan FIKP Unhas 2020',
                      numSurat: '44/UN4.15/KEP/2020',
                      tglSurat: '17-06-2020',
                      from: 'Fakultas Ilmu Kelautan dan Perikanan',
                      type: 'Insentif Kinerja',
                      status: 'Dihitung Semester Ini',
                      isDaftarKegiatan: true,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemCount: 3,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TitlePersuratan(title: 'Bukti Kinerja', onTap: () {}),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return const PersuratanCard(
                      title:
                          'KEPUTUSAN DEKAN an. TIM TASK FORCE Reakreditasi Prodi S3 Ilmu Perikanan FIKP Unhas 2020',
                      numSurat: '44/UN4.15/KEP/2020',
                      tglSurat: '17-06-2020',
                      from: 'Fakultas Ilmu Kelautan dan Perikanan',
                      type: 'Insentif Kinerja',
                      status: 'Dihitung Semester Ini',
                      isDaftarKegiatan: false,
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 12),
                  itemCount: 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PersuratanCard extends StatelessWidget {
  final String title;
  final String numSurat;
  final String tglSurat;
  final String from;
  final String type;
  final String status;
  final bool isDaftarKegiatan;

  const PersuratanCard({
    super.key,
    required this.title,
    required this.numSurat,
    required this.tglSurat,
    required this.from,
    required this.type,
    required this.status,
    required this.isDaftarKegiatan,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: MediaQuery.of(context).size.width - 50,
      decoration: BoxDecoration(
        color: Palette.red.withOpacity(.10),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  numSurat,
                  style: kTextTheme.bodySmall?.copyWith(
                    color: Palette.black.withOpacity(.50),
                  ),
                ),
              ),
              Text(
                tglSurat,
                style: kTextTheme.bodyMedium?.copyWith(
                  color: Palette.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: kTextTheme.bodyLarge?.copyWith(
              color: Palette.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.send,
                color: Palette.redSmooth,
                size: 14,
              ),
              const SizedBox(width: 6),
              Text(
                from,
                style: kTextTheme.bodySmall?.copyWith(
                  color: Palette.redSmooth,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.account_circle_rounded,
                color: Palette.redSmooth,
                size: 14,
              ),
              const SizedBox(width: 6),
              Text(
                type,
                style: kTextTheme.bodySmall?.copyWith(
                  color: Palette.redSmooth,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  isDaftarKegiatan
                      ? const Icon(
                          Icons.edit_square,
                          color: Palette.redSmooth,
                          size: 14,
                        )
                      : const Icon(
                          Icons.close,
                          color: Palette.redSmooth,
                          size: 14,
                        ),
                  const SizedBox(width: 6),
                  Text(
                    status,
                    style: kTextTheme.bodySmall?.copyWith(
                      color: Palette.redSmooth,
                    ),
                  ),
                ],
              ),
              isDaftarKegiatan
                  ? Container()
                  : const Icon(
                      Icons.file_download_rounded,
                      color: Palette.redSmooth,
                      size: 18,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

class TitlePersuratan extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const TitlePersuratan({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: kTextTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Row(
            children: [
              Text(
                'Lainnya',
                style: kTextTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Palette.red,
                ),
              ),
              const Icon(
                Icons.arrow_forward,
                color: Palette.red,
                size: 14,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MenuCardPersuratanDosen extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  const MenuCardPersuratanDosen(
      {Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWellContainer(
          onTap: onTap,
          radius: 12,
          color: Palette.red.withOpacity(.1),
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 8),
          child: const Icon(
            Icons.school,
            color: Palette.red,
            size: 38,
          ),
        ),
        Flexible(
          child: Text(
            title,
            style: kTextTheme.bodySmall,
            overflow: TextOverflow.visible,
            maxLines: 3,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
