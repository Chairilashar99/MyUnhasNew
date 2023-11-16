import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/constants/text_const.dart';

class MenuAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actions;
  final String? title;

  const MenuAppBar({
    super.key,
    this.leading,
    this.actions,
    this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.white,
      foregroundColor: Palette.red,
      leading: leading,
      title: Text(
        title ?? '',
        style: kTextTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      actions: actions,
    );
  }
}
