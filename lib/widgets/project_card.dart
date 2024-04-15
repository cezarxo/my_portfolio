// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

import 'package:flutter/material.dart';

import 'package:my_portfolio/utils/project_utils.dart';

import '../styles/colors.dart';

class ProjectCardWidget extends StatelessWidget {
  const ProjectCardWidget({
    super.key,
    required this.project,
  });
  final ProjectUtils project;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 290,
      width: 260,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: CustomColor.bgLight2, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          //project img
          Image.asset(
            project.image,
            height: 140,
            width: 260,
            fit: BoxFit.cover,
          ),
          //project title
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 15, 12, 12),
            child: Text(
              project.title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: CustomColor.whitePrimary,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              project.subtitle,
              style: const TextStyle(
                fontSize: 12,
                color: CustomColor.whiteSecondary,
              ),
            ),
          ),
          const Spacer(),
          //footer
          Container(
            color: CustomColor.bgLightl,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            child: Row(
              children: [
                const Text(
                  'Availabe on:',
                  style: TextStyle(
                    fontSize: 12,
                    color: CustomColor.yellowSecondary,
                  ),
                ),
                const Spacer(),
                if (project.iosLink != null)
                  InkWell(
                    onTap: () {
                      //open link
                      js.context.callMethod('open', [project.iosLink]);
                    },
                    child: Image.asset(
                      'assets/ios_icon.png',
                      width: 19,
                    ),
                  ),
                if (project.androidLink != null)
                  InkWell(
                    onTap: () {
                      //open link
                      js.context.callMethod("open", [project.androidLink]);
                    },
                    child: Image.asset(
                      'assets/android_icon.png',
                      width: 17,
                    ),
                  ),
                if (project.webLink != null)
                  InkWell(
                    onTap: () {
                      //open link
                      js.context.callMethod("open", [project.webLink]);
                    },
                    child: Image.asset(
                      'assets/web_icon.png',
                      width: 17,
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
