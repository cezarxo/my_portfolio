import 'package:flutter/material.dart';

import '../styles/colors.dart';

class SiteLogo extends StatelessWidget {
  final VoidCallback? onTap;
  const SiteLogo({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(
        'AM',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
          color: CustomColor.yellowSecondary,
        ),
      ),
    );
  }
}
