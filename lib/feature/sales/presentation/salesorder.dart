 
import 'package:datatablex/datatablex.dart';
import 'package:flutter/material.dart';


class SalesOrder extends StatelessWidget {
  const SalesOrder({super.key});

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
      title: "Sales Order",
      heads: [
        TableHead(title: 'Date', id: 'date'),
        TableHead(title: 'Narration', id: 'narration'),
        TableHead(title: 'Account Name', id: 'account_name'),
        TableHead(title: 'Amount', id: 'amount'),
        TableHead(title: "Sales Person", id: 'createdby'),
        TableHead(title: 'Action', id: 'id',isbutton: true,button: (data){
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TableButton(
                ontap: (){

                },
                icon: Icons.edit, bgColor: Colors.blue,
              ),TableButton(
                ontap: (){

                },
                bgColor: Colors.red,
                icon: Icons.delete,
              ),
            ],
          );
        })
      ],
      items: [],
    );
  }
}
