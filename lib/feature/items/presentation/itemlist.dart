import 'package:fluent_ui/fluent_ui.dart';

import '../../../shared/widgets/datalisting.dart';

class ItemListing extends StatelessWidget {
  const ItemListing({super.key});

  @override
  Widget build(BuildContext context) {
    return  DataTableV2(
      titleWidget: Row(
        children: [
          Button(
            onPressed: () {},
            child: Text("Create New"),
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
