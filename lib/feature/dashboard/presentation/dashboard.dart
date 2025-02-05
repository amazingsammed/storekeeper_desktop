import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/dashboard/presentation/pages.dart';

import '../controller/dashboardcontroller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardController controller = Get.put(DashboardController());
  PaneDisplayMode displayMode = PaneDisplayMode.compact;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(

        body: NavigationView(
          transitionBuilder: (c,a){
            return c;
          },
          // appBar:  NavigationAppBar(
          //  // automaticallyImplyLeading: false,
          //   title: MenuFlyout(
          //
          //       items: [
          //         MenuFlyoutSubItem(
          //           text: const Text('New'),
          //           items: (context) {
          //             return [
          //               MenuFlyoutItem(
          //                 text: const Text('Plain Text Documents'),
          //                 onPressed: () {},
          //               ),
          //               MenuFlyoutItem(
          //                 text: const Text('Rich Text Documents'),
          //                 onPressed: () {},
          //               ),
          //               MenuFlyoutItem(
          //                 text: const Text('Other Formats'),
          //                 onPressed: () {},
          //               ),
          //             ];
          //           },
          //         ),
          //         MenuFlyoutItem(text: const Text('Open'), onPressed: () {}),
          //         MenuFlyoutItem(text: const Text('Save'), onPressed: () {}),
          //         const MenuFlyoutSeparator(),
          //         MenuFlyoutItem(text: const Text('Exit'), onPressed: () {}),
          //       ]
          //   ),
          // ),
          pane: NavigationPane(
            displayMode: displayMode,
            selected: controller.selectedPage.value,
            onItemPressed: (index) {
              // print(index);
              controller.selectedPage.value = index;
            },
            onChanged: (index) {},
            items: items,
            footerItems: [
              PaneItem(
                icon: const Icon(FluentIcons.settings),
                title: const Text('Settings'),
                body: Container(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
