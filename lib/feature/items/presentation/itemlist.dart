import 'package:fluent_ui/fluent_ui.dart';
import 'package:get/get.dart';
import 'package:storekepper_desktop/feature/items/presentation/forms/additem.dart';
import 'package:storekepper_desktop/shared/widgets/button_c.dart';

import '../../../shared/widgets/datalisting.dart';

class ItemListing extends StatelessWidget {
  const ItemListing({super.key});

  @override
  Widget build(BuildContext context) {
    return  DataTableV2(
      titleWidget: Row(
        children: [
          PrimaryButton(
            onTap: () {
              Get.dialog(AddProduct());
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
      title: "Items List",
      heads: [
        TableHead(title: 'Name', id: 'name'),
        TableHead(title: 'Group', id: 'group'),
        TableHead(title: 'Selling Price', id: 'sprice'),
        TableHead(title: 'Status', id: 'status'),
      ],
      items: [],
    );

  }
}
