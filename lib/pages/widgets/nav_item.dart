import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';

class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const NavItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 6),
            Icon(
              icon,
              color: isActive ? Palette.white : Palette.pink,
            ),
            const SizedBox(height: 2),
            ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 30),
              child: Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: kTextTheme.bodyMedium?.copyWith(
                  height: 1,
                  color: isActive ? Palette.white : Palette.pink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
