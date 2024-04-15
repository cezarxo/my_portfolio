import 'package:flutter/material.dart';
import 'package:my_portfolio/styles/styles.dart';
import '../constants/nav_titles.dart';
import '../styles/colors.dart';
import 'site_logo.dart';

class DesktopHeader extends StatelessWidget {
  final VoidCallback? onTap;
  final Function(int) onMenuTap;
  const DesktopHeader({super.key, this.onTap, required this.onMenuTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: onTap),
          const Spacer(),
          for (int i = 0; i < navTitles.length; i++)
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: TextButton(
                  onPressed: () {
                    onMenuTap(i);
                  },
                  child: Text(navTitles[i],
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: CustomColor.whitePrimary))),
            )
        ],
      ),
    );
  }
}
