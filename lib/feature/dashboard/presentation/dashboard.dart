import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/dashboard/presentation/pages.dart';

import '../controller/dashboardcontroller.dart';

class DashboardScreen extends StatelessWidget {
  DashboardController controller = Get.put(DashboardController());


  PaneDisplayMode displayMode = PaneDisplayMode.compact;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return NavigationView(
        appBar: const NavigationAppBar(
          automaticallyImplyLeading: false,
          title: Text('My Store App'),
        ),
        pane: NavigationPane(
          displayMode: displayMode,
          selected: controller.selectedPage.value,
          onItemPressed: (index) {
            print(index);
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
      );
    });
  }
}
