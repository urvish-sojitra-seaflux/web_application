import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_application/constants/styles.dart';
import 'package:web_application/routing/routes.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = overViewPageRoute.obs;
  var hoverItem = "".obs;

  changeActiveItemInfo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (isActive(itemName)) {
      hoverItem.value = itemName;
    }
  }

  isActive(String itemName) => activeItem.value == itemName;
  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overViewPageRoute:
        return _customIcon(itemName, Icons.trending_up);
      case driverPageRoute:
        return _customIcon(itemName, Icons.drive_eta_sharp);
      case clientPageRoute:
        return _customIcon(itemName, Icons.people_alt_outlined);
      case authenticationPageRoute:
        return _customIcon(itemName, Icons.exit_to_app);
      default:
        return _customIcon(itemName, Icons.exit_to_app);
    }
  }

  Widget _customIcon(String itemName, IconData icon) {
    if (isActive(itemName)) {
      return Icon(
        icon,
        size: 22,
        color: dark,
      );
    }
    return Icon(
      icon,
      color: isHovering(itemName) ? dark : lightGrey,
    );
  }
}
