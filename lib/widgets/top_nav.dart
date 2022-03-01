import 'package:flutter/material.dart';
import 'package:web_application/constants/styles.dart';
import 'package:web_application/helpers/responsiveness.dart';
import 'package:web_application/widgets/custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) =>
    AppBar(
      leading: ResponsiveWidget.isLargeScreen(context)
          ? Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 14),
                  child: Image.asset('assets/icons/logo.png'),
                  width: 50,
                )
              ],
            )
          : IconButton(
              onPressed: () {
                key.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
              )),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Visibility(
              child: CustomText("Dash", lightGrey, 24, FontWeight.bold)),
          Expanded(child: Container()),
          IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: dark.withOpacity(0.7),
                ),
              ),
              Positioned(
                top: 7,
                right: 7,
                child: Container(
                  width: 12,
                  height: 12,
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(color: light, width: 2),
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 22,
                color: lightGrey,
              ),
              const SizedBox(
                width: 24,
              ),
              const CustomText(
                  "Santos Enoque", lightGrey, 16, FontWeight.normal),
              const SizedBox(
                width: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: const EdgeInsets.all(1),
                  margin: const EdgeInsets.all(1),
                  child: const Icon(
                    Icons.person_outlined,
                    color: dark,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      iconTheme: const IconThemeData(color: dark),
      backgroundColor: Colors.white,
    );
