

import 'package:flutter/material.dart';

class Dialogpreview extends StatelessWidget {
  final String title;
  final String? subtile;
  final Map<dynamic,dynamic>data;
  const Dialogpreview({super.key,  this.title = "Data preview", this.subtile, required this.data});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    content: Container(
      height: 500,
      width: 600,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(title),
            subtitle: subtile!=null?Text(subtile!):null,

          ),
          Expanded(child: ListView(
            children: data.keys.map((e)=>Card(
              
              child: ListTile(
                title: Text(data[e].toString()),
                subtitle: Text(e.toString()),
              ),
            )).toList(),
          ))
        ],
      ),
    )
    );
  }
}
