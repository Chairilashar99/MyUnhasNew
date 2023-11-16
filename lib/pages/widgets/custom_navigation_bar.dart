import 'package:flutter/material.dart';
import 'package:my_unhas_new/constants/color_const.dart';
import 'package:my_unhas_new/pages/widgets/nav_item.dart';
// import 'package:flutter_e_wali/core/constant/color_const.dart';
// import 'package:flutter_e_wali/src/presentation/widgets/nav_item.dart';

class CustomNavigationBar extends StatelessWidget {
  final int value;
  final ValueNotifier<int> selectedIndex;
  final List<IconData> listIcons;
  final List<String> listTitle;

  const CustomNavigationBar({
    super.key,
    required this.value,
    required this.listIcons,
    required this.listTitle,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        color: Palette.red,
      ),
      height: 65,
      width: MediaQuery.of(context).size.width,
      child: Builder(
        builder: (context) {
          return Row(
            children: <Widget>[
              for (int i = 0; i < listTitle.length; i++)
                NavItem(
                  icon: listIcons[i],
                  label: listTitle[i],
                  onTap: () => selectedIndex.value = i,
                  isActive: value == i,
                ),
            ],
          );
        },
      ),
    );
  }
}
