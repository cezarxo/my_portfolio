import 'package:flutter/material.dart';
import '../styles/colors.dart';

class MainMobile extends StatelessWidget {
  const MainMobile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    // final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      constraints: const BoxConstraints(minWidth: 560),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                CustomColor.scaffoldBg.withOpacity(0.6),
                CustomColor.scaffoldBg.withOpacity(0.6),
              ]).createShader(bounds); // LinearGradient
            },
            blendMode: BlendMode.srcATop,
            child: Image.asset(
              'assets/photo.jpg',
              width: screenWidth,
              height: 250,
            ),
          ),
          const SizedBox(height: 30),
          const Text(
            "Hi,\n I'm Abdulaziz Musa\n A Flutter Developer",
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                height: 1.5,
                color: CustomColor.whitePrimary),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: 195.0,
            child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: CustomColor.scaffoldBg),
                    backgroundColor: CustomColor.yellowPrimary),
                child: const Text(
                  'Get in Touch',
                  style: TextStyle(color: CustomColor.scaffoldBg),
                )),
          )
        ],
      ),
    );
  }
}
