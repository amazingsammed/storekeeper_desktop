
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:storekepper_desktop/shared/constant/colors.dart';

import '../../../../shared/widgets/ktextfields.dart';

class SalesForm extends StatelessWidget {
  const SalesForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Sales From"),
    ),
    body: Row(
      children: [
        Expanded(
          flex: 5,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.black12
                ),
                child: Row(
                  children:[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("no"),
                    ),
                    Expanded( flex:4,child: Text("Name of Item")),
                    Expanded( flex:2,child: Text("Quantity")),
                    Expanded(child: Text("Rate")),
                    Expanded(child: Text("Amount")),
                  ]
                ),
              ),

                    
            ],
          ),
        ),
        kSizedbox20,
        Expanded(
          child: Column(
            children: [
              FormBuilderTextField(
                name: 'search',
                decoration: InputDecoration(
                  hintText: "Search Item",
                  prefixIcon: Icon(Icons.search),

                  border: OutlineInputBorder(),
                ),
              ),

              Expanded(
                child: ListView.builder(

                      itemCount: 20,
                      itemBuilder: (BuildContext context, int index) {
                        return Text('data');
                      },
                    ),
              ),
                ],
          ),
        ),
      ],
    )
    );
  }
}
