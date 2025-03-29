import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/dashboard/presentation/pages.dart';

import '../../settings/presentation/settings.dart';
import '../controller/dashboardcontroller.dart';
import '_component/menu_bar.dart';

class DashboardScreen extends StatelessWidget {
  DashboardController controller = Get.put(DashboardController());
  PaneDisplayMode displayMode = PaneDisplayMode.open;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(

        body: NavigationView(
          transitionBuilder: (c,a){
            return c;
          },
          appBar:  NavigationAppBar(
            automaticallyImplyLeading: false,
            title: MyMenuBar(),
          ),
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
                body: MySettingsPage(),
              ),
            ],
          ),
        ),
      );
    });
  }
}
