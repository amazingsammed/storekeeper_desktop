import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/dashboard/presentation/_component/toolbarItem.dart';
import 'package:storekepper_desktop/feature/items/presentation/forms/addgroup.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';

import '../../../shared/widgets/datalisting.dart';
import '../data/local/itemcontroller.dart';

class GroupPage extends StatelessWidget {
  final ItemDB controller = Get.put(ItemDB());

  GroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MainPageWithToolBar(
      toolBar: ItemToolBar(),
      child: Obx(() {
        return DataTableV2(
          titleWidget: Row(
            children: [
              PrimaryButton(
                onTap: () {
                  Get.dialog(AddGroup());
                },
                title: "Create New",
              ),
            ],
          ),
          selecteditems: (e) {
            print(e);
          },
          ontap: (element) {
            print(element['id'].runtimeType);
          },
          title: "Item Grouping",
          heads: [
            TableHead(title: 'Date', id: 'date'),
            TableHead(title: 'Name', id: 'name'),
            TableHead(title: 'Category', id: 'cat'),
            TableHead(title: 'status', id: 'status'),
          ],
          items: controller.allGroup.value,
        );
      }),
    );
  }
}
