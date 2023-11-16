import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/pages/widgets/menu_card.dart';

class HomePageDosen extends StatelessWidget {
  const HomePageDosen({super.key});

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
                  style: kTextTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Flexible(
                child: Text(
                  'Prof. Dr. Ir. Achmar Mallawa, DEA',
                  style: kTextTheme.titleLarge?.copyWith(
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
              SizedBox(
                height: 19,
              ),
              Wrap(
                spacing: 16,
                runSpacing: 47,
                direction: Axis.horizontal,
                children: List.generate(8, (index) {
                  final titles = [
                    "Peta",
                    "Dana Seminar",
                    "Turnitin",
                    "Sistem Informasi Reward",
                    "Neosia",
                    "Sikola",
                    "Tracer Study",
                    "Pengukuran CPL"
                  ];
                  final url = [
                    "https://neosia.unhas.ac.id/",
                    "https://sikola.unhas.ac.id/",
                    "https://neosia.unhas.ac.id/",
                    "https://neosia.unhas.ac.id/",
                    "https://neosia.unhas.ac.id/",
                    "https://sikola.unhas.ac.id/",
                    "https://neosia.unhas.ac.id/",
                    "https://neosia.unhas.ac.id/"
                  ];
                  return SizedBox(
                    width: (MediaQuery.of(context).size.width - (4 * 28)) / 4,
                    child: MenuCard(
                      title: titles[index],
                      url: url[index],
                    ),
                  );
                }),
              ),
              const SizedBox(height: 24),
              Flexible(
                child: Text(
                  'Panduan Portal Akademiks',
                  style: kTextTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Flexible(
                child: Text(
                  'Panduan pemakaian portal akademik berisi infomasi seputar cara penggunaan portal akademik bagi pengguna.',
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
