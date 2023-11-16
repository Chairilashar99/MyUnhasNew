import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerItem {
  final String title;
  final String iconPath;
  final Function? onTap;

  DrawerItem({required this.title, required this.iconPath, this.onTap});
}

final eWaliDrawerItems = [
  DrawerItem(
      title: "KRS MAHASISWA",
      iconPath: 'assets/icon_krs.png',
      onTap: () => Get.toNamed('/krs-mahasiswa')),
  DrawerItem(
      title: "GRAFIK IPK/SKS",
      iconPath: 'assets/icon_line_chart.png',
      onTap: () => Get.toNamed('/grafik')),
  DrawerItem(
      title: "HISTORY PEMBAYARAN",
      iconPath: 'assets/icon_payment.png',
      onTap: () => Get.toNamed('/history-pembayaran')),
  DrawerItem(
      title: "SETTING",
      iconPath: 'assets/icon_setting.png',
      onTap: () => Get.toNamed('/settings')),
  DrawerItem(title: "Logout", iconPath: 'assets/icon_logout.png', onTap: () {}),
];

final mahasiswaDrawerItems = [
  DrawerItem(
      title: "KRS",
      iconPath: 'assets/icon_krs.png',
      onTap: () => Get.toNamed('/krs')),
  DrawerItem(
      title: "KHS & NILAI",
      iconPath: 'assets/icon_khs.png',
      onTap: () => Get.toNamed('/khs-nilai')),
  DrawerItem(
      title: "TRANSKRIP",
      iconPath: 'assets/icon_transkrip.png',
      onTap: () => Get.toNamed('/transkrip')),
  DrawerItem(
      title: "SETTING", iconPath: 'assets/icon_setting.png', onTap: () {}),
  DrawerItem(title: "Logout", iconPath: 'assets/icon_logout.png', onTap: () {}),
];

class AppDrawer extends StatelessWidget {
  final List<DrawerItem> drawerItems;

  AppDrawer({required this.drawerItems});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("Test"),
            accountEmail: const Text("test@mail.com"),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWgelHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"),
            ),
            decoration: BoxDecoration(
              color: Colors.blueGrey[900],
            ),
          ),
          ...drawerItems
              .map((item) => ListTile(
                    leading: Image.asset(item.iconPath, height: 20),
                    title: Text(item.title),
                    onTap: item.onTap as void Function()?,
                  ))
              .toList(),
        ],
      ),
    );
  }
}
