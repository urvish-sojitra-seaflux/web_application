import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:web_application/constants/controller.dart';
import 'package:web_application/constants/styles.dart';
import 'package:web_application/widgets/custom_text.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final VoidCallback onTap;

  const VerticalMenuItem(this.itemName, this.onTap, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      child: Obx(() => Container(
            color: menuController.onHover(itemName)
                ? lightGrey.withOpacity(0.1)
                : Colors.transparent,
            child: Row(children: [
              Visibility(
                child: Container(
                  width: 3,
                  height: 72,
                  color: dark,
                ),
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
                visible: menuController.isHovering(itemName) ||
                    menuController.isActive(itemName),
              ),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName),
                  ),
                  menuController.isActive(itemName)
                      ? Flexible(
                          child: CustomText(
                              itemName,
                              menuController.isHovering(itemName)
                                  ? dark
                                  : lightGrey,
                              16,
                              FontWeight.normal),
                        )
                      : Flexible(
                          child:
                              CustomText(itemName, dark, 18, FontWeight.bold),
                        ),
                ],
              ))
            ]),
          )),
    );
  }
}
