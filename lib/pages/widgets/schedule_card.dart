import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';

class ScheduleCard extends StatelessWidget {
  final String title;
  final String time;
  final String code;
  final String subtitle;
  final String label;

  const ScheduleCard({
    Key? key,
    required this.title,
    required this.time,
    required this.code,
    required this.subtitle,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Palette.pinkDark.withOpacity(0.3),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        title,
                        style: kTextTheme.bodyLarge?.copyWith(
                          color: Palette.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        time,
                        style: kTextTheme.bodyLarge?.copyWith(
                          color: Palette.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  code,
                  style: kTextTheme.bodyMedium?.copyWith(
                    color: Palette.red,
                  ),
                ),
                Text(
                  subtitle,
                  style: kTextTheme.bodyMedium?.copyWith(
                    color: Palette.red,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            height: 34,
            width: 112,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Palette.red,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0),
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: kTextTheme.bodyMedium?.copyWith(
                  color: Palette.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
