import 'package:flutter/material.dart';
import '../styles/styles.dart';
import 'site_logo.dart';

class MobileHeader extends StatelessWidget {
  final VoidCallback? onLogoTap;
  final VoidCallback? onMenuTap;
  const MobileHeader({super.key, this.onLogoTap, this.onMenuTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.maxFinite,
      margin: const EdgeInsets.fromLTRB(40, 5, 20, 5),
      decoration: kHeaderDecoration,
      child: Row(
        children: [
          SiteLogo(onTap: onLogoTap),
          const Spacer(),
          IconButton(onPressed: onMenuTap, icon: const Icon(Icons.menu)),
          const SizedBox(width: 15)
        ],
      ),
    );
  }
}
