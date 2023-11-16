import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';

class TitleRiwayat extends StatelessWidget {
  final Widget item;
  final String title;

  const TitleRiwayat({
    super.key,
    required this.item,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(top: 24),
      decoration: const BoxDecoration(color: Palette.onDisableColor),
      child: ExpansionTile(
        title: Row(
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
              onTap: () {
                Get.toNamed('/form-personal-data-dosen');
              },
              child: const Icon(
                Icons.add,
                color: Palette.black,
              ),
            )
          ],
        ),
        iconColor: Palette.red,
        collapsedIconColor: Palette.red,
        collapsedTextColor: Palette.black,
        textColor: Palette.black,
        shape: Border.all(color: Colors.transparent),
        collapsedShape: Border.all(color: Colors.transparent),
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Palette.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Palette.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 18),
                item,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
