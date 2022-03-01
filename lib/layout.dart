import 'package:flutter/material.dart';
import 'package:web_application/helpers/responsiveness.dart';
import 'package:web_application/widgets/large_screen.dart';
import 'package:web_application/widgets/side_menu.dart';
import 'package:web_application/widgets/small_screen.dart';
import 'package:web_application/widgets/top_nav.dart';

class SiteLayout extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();
  SiteLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: topNavigationBar(context, scaffoldkey),
      drawer: const Drawer(child: SideMenu()),
      body: const ResponsiveWidget(LargeScreen(), SmallScreen(), SmallScreen()),
    );
  }
}
