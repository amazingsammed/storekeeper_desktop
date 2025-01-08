import 'package:fluent_ui/fluent_ui.dart';

import '../../../shared/widgets/datalisting.dart';

class GroupPage extends StatelessWidget {
  const GroupPage({super.key});

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
      title: "Item Grouping",
      heads: [
        TableHead(title: 'Date', id: 'date'),
        TableHead(title: 'Name', id: 'name'),
        TableHead(title: 'Category', id: 'cat'),
        TableHead(title: 'status', id: 'status'),
      ],
      items: [],
    );

  }
}
