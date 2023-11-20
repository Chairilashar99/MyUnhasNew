import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/asset_path.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';

class MyUnhasAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;

  const MyUnhasAppBar({super.key, this.leading, this.actions});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      leadingWidth: 250,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 12),
          Image.asset(
            AssetPath.getImage('logo-merah.png'),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              'My',
              style: kTextTheme.headlineMedium?.copyWith(
                color: Palette.black,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Flexible(
            child: Text(
              'Unhas',
              style: kTextTheme.headlineMedium?.copyWith(
                color: Palette.red,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
