import 'package:flutter/material.dart';
import '../constants/nav_titles.dart';
import '../styles/colors.dart';

class DrawerMobile extends StatelessWidget {
   final Function(int) onNavItemTap;
  const DrawerMobile({
    super.key, required this.onNavItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: CustomColor.scaffoldBg,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close)),
            ),
          ),
          for (int i = 0; i < navIcons.length; i++)
            ListTile(
              onTap: () { onNavItemTap(i);},
              contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
              leading: Icon(navIcons[i]),
              title: Text(navTitles[i]),
              titleTextStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16.0,
                color: CustomColor.whitePrimary,
              ),
            ),
        ],
      ),
    );
  }
}