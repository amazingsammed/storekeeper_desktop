import 'package:fluent_ui/fluent_ui.dart';

import '../../../shared/widgets/datalisting.dart';

class Saleslisting extends StatelessWidget {
  const Saleslisting({super.key});

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
        title: "Sales Listing",
        heads: [
          TableHead(title: 'Date', id: 'date'),
          TableHead(title: 'Narration', id: 'narration'),
          TableHead(title: 'Account Name', id: 'account_name'),
          TableHead(title: 'Amount', id: 'amount'),
          TableHead(title: "Sales Person", id: 'createdby')
        ],
        items: [],
      );

  }
}