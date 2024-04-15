import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/constants/sms_links.dart';
import '../styles/colors.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'custom_text_field.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
      color: CustomColor.bgLightl,
      child: Column(
        children: [
          //title
          const Text(
            'Get in touch',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: CustomColor.whitePrimary),
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700,
                maxHeight: 100,
              ),
              child: LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth >= kMinDesktopWidth) {
                  return getNameEmailFieldDesktop();
                }

                // else
                return getNameEmailFieldMobile();
              })),
          const SizedBox(height: 15),
          //message
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: const CustomTextField(
              hintText: 'Your message',
              maxLines: 16,
            ),
          ),
          const SizedBox(height: 20),
          //btn
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: SizedBox(
              width: double.maxFinite,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(color: CustomColor.whitePrimary),
                    backgroundColor: CustomColor.yellowPrimary),
                onPressed: () {},
                child: const Text(
                  'Get in touch',
                  style: TextStyle(
                    color: CustomColor.whitePrimary,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300),
            child: const Divider(),
          ),
          const SizedBox(height: 15),
          //SMS link icons
          Wrap(
            spacing: 12.0,
            runAlignment: WrapAlignment.center,
            runSpacing: 12.0,
            children: [
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SmsLinks.github]);
                },
                child: Image.asset(
                  'github.png',
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SmsLinks.linkedIn]);
                },
                child: Image.asset(
                  'linkedin.png',
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SmsLinks.telegram]);
                },
                child: Image.asset(
                  'telegram.png',
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SmsLinks.instagram]);
                },
                child: Image.asset(
                  'instagram.png',
                  width: 28,
                ),
              ),
              InkWell(
                onTap: () {
                  js.context.callMethod('open', [SmsLinks.facebook]);
                },
                child: Image.asset(
                  'facebook.png',
                  width: 28,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Row getNameEmailFieldDesktop() {
    return const Row(
      children: [
        //name
        Flexible(
          child: CustomTextField(
            hintText: 'Your name',
          ),
        ),
        SizedBox(width: 15),
        //email
        Flexible(
          child: CustomTextField(
            hintText: 'Your email',
          ),
        ),
      ],
    );
  }

  Column getNameEmailFieldMobile() {
    return const Column(
      children: [
        //name
        Flexible(
          child: CustomTextField(
            hintText: 'Your name',
          ),
        ),
        SizedBox(height: 15),
        //email
        Flexible(
          child: CustomTextField(
            hintText: 'Your email',
          ),
        ),
      ],
    );
  }
}
