import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_application/constants/controller.dart';
import 'package:web_application/helpers/responsiveness.dart';
import 'package:web_application/widgets/custom_text.dart';
import 'package:web_application/widgets/side_menu_items.dart';
import '../constants/styles.dart';
import '../routing/routes.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: light,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    const Flexible(
                      child: CustomText(
                        "Dash",
                        active,
                        20,
                        FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: _width / 48),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(color: lightGrey.withOpacity(.1)),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map((itemName) => SideMenuItem(
                        itemName == authenticationPageRoute
                            ? "Log Out"
                            : itemName, () {
                      if (itemName == authenticationPageRoute) {
                        //TODO : go to authenticate

                      }
                      if (!menuController.isActive(itemName)) {
                        menuController.changeActiveItemInfo(itemName);

                        if (ResponsiveWidget.isSmallScreen(context)) Get.back();
                        // navigationController.navigateTo(item.route);
                      }
                    }))
                .toList(),
          )
        ],
      ),
    );
  }
}
