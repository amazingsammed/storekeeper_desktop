import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/dashboard/presentation/_component/toolbarItem.dart';
import 'package:storekepper_desktop/feature/items/presentation/forms/addunit.dart';

import '../../../shared/widgets/button_c.dart';
import '../../../shared/widgets/datalisting.dart';
import '../controller/itemcontroller.dart';
import '../data/local/item_localdb.dart';

class UnitsPage extends StatelessWidget {
  final ItemController controller = Get.put(ItemController());
  UnitsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MainPageWithToolBar(
      toolBar: ItemToolBar(),
      child: DataTableV2(
        titleWidget: Row(
          children: [
            PrimaryButton(
              onTap: () {
                Get.dialog(AddUnit());
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
        title: "Units",
        heads: [
          TableHead(title: 'Name', id: 'name'),
          TableHead(title: 'Status', id: 'status'),
      
        ],
        items: controller.allUnit.value,
      ),
    );

  }
}
