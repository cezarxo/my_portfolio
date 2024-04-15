import 'package:flutter/material.dart';

import '../styles/colors.dart';

class MainDesktop extends StatelessWidget {
  const MainDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      height: screenHeight / 1.2,
      constraints: const BoxConstraints(minHeight: 250.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Hi,\n I'm Abdulaziz Musa\n A Flutter Developer",
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                    color: CustomColor.whitePrimary),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 250.0,
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                            color: CustomColor.scaffoldBg),
                        backgroundColor: CustomColor.yellowPrimary),
                    child: const Text(
                      'Get in Touch',
                      style: TextStyle(color: CustomColor.scaffoldBg),
                    )),
              )
            ],
          ),
          Image.asset(
            'assets/photo.jpg',
            width: screenWidth / 6,
          )
        ],
      ),
    );
  }
}