import 'package:flutter/material.dart';
import '../constants/skills.dart';
import '../styles/colors.dart';

class SkillsDesktop extends StatelessWidget {
  const SkillsDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 450),
          //platforms
          child: Wrap(
            spacing: 5.0,
            runSpacing: 5.0,
            children: [
              for (int i = 0; i < platformItems.length; i++)
                Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: CustomColor.bgLight2,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    leading: Image.asset(platformItems[i]["img"], width: 26),
                    title: Text(platformItems[i]["title"]),
                  ),
                  //Skills
                ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 500),
            child: Wrap(
              spacing: 10.0,
              runSpacing: 10.0,
              children: [
                for (int i = 0; i < skillItems.length; i++)
                  Chip(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12.0, horizontal: 16.0),
                    backgroundColor: CustomColor.bgLight2,
                    label: Text(skillItems[i]['title']),
                    avatar: Image.asset(skillItems[i]['img']),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
