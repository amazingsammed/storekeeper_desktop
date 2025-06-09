 

import 'package:datatablex/datatablex.dart';
import 'package:flutter/material.dart';

class AccountsPayable extends StatelessWidget {
  const AccountsPayable({super.key});

  @override
  Widget build(BuildContext context) {
    return  DataTableX(
      titleWidget: Row(
        children: [
          ElevatedButton (
            onPressed: () {},
            child: Text("Create New"),
          ),
        ],
      ),

      onTap: (element) {
        print(element['id'].runtimeType);
      },
      title: "Accounts Payable",
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
