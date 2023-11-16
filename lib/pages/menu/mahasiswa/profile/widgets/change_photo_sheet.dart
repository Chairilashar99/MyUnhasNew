import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';

class ChangePhotoProfileSheet extends StatelessWidget {
  final VoidCallback onTap;
  final bool isPhotoProfileExist;

  const ChangePhotoProfileSheet({
    super.key,
    required this.onTap,
    required this.isPhotoProfileExist,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
      decoration: const BoxDecoration(
        color: Palette.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(24),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: onTap,
              style: FilledButton.styleFrom(backgroundColor: Palette.pinkDark),
              label: const Text('Change Profile Photo'),
              icon: const Icon(
                Icons.image_rounded,
              ),
            ),
          ),
          if (isPhotoProfileExist) ...[
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                style: FilledButton.styleFrom(
                  backgroundColor: Palette.red,
                ),
                onPressed: () {},
                label: const Text('Remove Profile Photo'),
                icon: const Icon(
                  Icons.delete,
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
