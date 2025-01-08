import 'package:fluent_ui/fluent_ui.dart';

import '../../../shared/widgets/datalisting.dart';

class UnitsPage extends StatelessWidget {
  const UnitsPage({super.key});

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
      title: "Units",
      heads: [
        TableHead(title: 'Name', id: 'name'),
        TableHead(title: 'Status', id: 'status'),

      ],
      items: [],
    );

  }
}
