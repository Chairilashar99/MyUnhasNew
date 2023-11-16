import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';
import 'package:my_unhas_new/pages/widgets/inkwell_container.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuCard extends StatelessWidget {
  final String title;
  final String url;
  const MenuCard({Key? key, required this.title, required this.url})
      : super(key: key);

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWellContainer(
          onTap: _launchUrl,
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
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
