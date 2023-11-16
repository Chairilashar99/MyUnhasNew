import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_unhas_new/constants/asset_path.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/pages/widgets/glassmorphism.dart';

class HomepageWali extends StatelessWidget {
  const HomepageWali({
    super.key,
  });

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
                child: Text(
                  'Selamat Siang',
                  style: kTextTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  'Andi Ilhamsyah Idris',
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
                        vertical: 16,
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
                            'Semester Awal 2023/2024',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: kTextTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Palette.white,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Glassmorphism(
                            blur: 5,
                            opacity: .15,
                            radius: 99,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  const Icon(
                                    Icons.change_circle_outlined,
                                    size: 20,
                                    color: Palette.white,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'Pilih Semester',
                                    style: kTextTheme.bodyMedium?.copyWith(
                                      color: Palette.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                controller: ScrollController(keepScrollOffset: false),
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      title: Text(
                        "Semester ${index + 1}",
                        style: kTextTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: Palette.black,
                          height: 1.2,
                        ),
                      ),
                      subtitle: Text(
                        'Rp.3.000.000',
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
                            'Terbayar',
                            style: kTextTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemCount: 4,
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
              ElevatedButton.icon(
                onPressed: () {},
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
                  Icons.download,
                  color: Palette.black,
                  size: 18,
                ),
                label: const Text(
                  'Unduh Panduan',
                  style: TextStyle(color: Palette.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
