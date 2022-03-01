import 'package:flutter/material.dart';
import 'package:web_application/helpers/responsiveness.dart';
import 'package:web_application/widgets/horizontal_menu_items.dart';
import 'package:web_application/widgets/vertical_menu_item.dart';

class SideMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;
  const SideMenuItem(this.itemName, this.onTap, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (ResponsiveWidget.isCustomScreen(context)) {
      return VerticalMenuItem(itemName, onTap);
    }

    return HorizontalMenuItem(itemName, onTap);
  }
}
