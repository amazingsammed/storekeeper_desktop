import 'package:fluent_ui/fluent_ui.dart';

import '../../../shared/widgets/datalisting.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

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
      title: "Category of Item",
      heads: [
        TableHead(title: 'Date', id: 'date'),
        TableHead(title: 'Name', id: 'narration'),
        TableHead(title: 'status', id: 'amount'),
      ],
      items: [],
    );

  }
}
