import 'package:flutter/material.dart';
import 'package:my_portfolio/styles/colors.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/footer_section.dart';
import 'package:my_portfolio/widgets/prject_section.dart';
// ignore: unused_import, avoid_web_libraries_in_flutter
import 'dart:js' as js;
import '../constants/size.dart';
import '../constants/sms_links.dart';
import '../widgets/desktop_header.dart';
import '../widgets/main_desktop.dart';
import '../widgets/main_mobile.dart';
import '../widgets/mobile_drawer.dart';
import '../widgets/mobile_header.dart';
import '../widgets/skills._mobile.dart';
import '../widgets/skills_desktop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final scrollController = ScrollController();
  final List<GlobalKey> navbarKeys = List.generate(4, (index) => GlobalKey());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomColor.scaffoldBg,
        endDrawer: constraints.maxWidth > kMinDesktopWidth
            ? null
            : DrawerMobile(
                onNavItemTap: (int navIndex) {
                  scaffoldKey.currentState?.closeEndDrawer();
                  scrollToSection(navIndex);
                },
              ),
        body: SingleChildScrollView(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // Main
              SizedBox(
                key: navbarKeys.first,
              ),
              if (constraints.maxWidth > kMinDesktopWidth)
                DesktopHeader(onMenuTap: (int navIndex) {
                  scrollToSection(navIndex);
                })
              else
                MobileHeader(
                  onLogoTap: () {},
                  onMenuTap: () {
                    scaffoldKey.currentState?.openEndDrawer();
                  },
                ),
              if (constraints.maxWidth > kMinDesktopWidth)
                const MainDesktop()
              else
                const MainMobile(),

              // // Skills
              Container(
                key: navbarKeys[1],
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
                width: screenWidth,
                color: CustomColor.bgLightl,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //title
                    const Text(
                      "What I can do",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: CustomColor.whitePrimary,
                      ),
                    ),
                    const SizedBox(height: 20),
                    //platfroms & skills
                    if (constraints.maxWidth >= kMedDesktopWidth)
                      const SkillsDesktop()
                    else
                      const SkillsMobile()
                  ],
                ),
              ),
              //Projects
              ProjectSection(
                key: navbarKeys[2],
              ),
              const SizedBox(height: 20),
              //Contact
              ContactSection(
                key: navbarKeys[3],
              ),
              //Footer
              const Footer(),
            ],
          ),
        ),
      );
    });
  }

  void scrollToSection(int navBarIndex) {
    if (navBarIndex == 4) {
      js.context.callMethod('open', [SmsLinks.blog]);
      return;
    }
    final key = navbarKeys[navBarIndex];
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
