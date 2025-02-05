

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class KTextField extends StatelessWidget {
  final String title;
  final String id;

  const KTextField({super.key, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 5,),
        FormBuilderTextField(
          name: id,
          decoration: InputDecoration(
            hintText: title,
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}


class KDropDown extends StatelessWidget {
  final List<String> children;
  final String title;
  final String id;
  const KDropDown({super.key, required this.children, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 5,),
        FormBuilderDropdown(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: title
            ),
            name: id, items: children.map((element){
              return DropdownMenuItem(
                value: element.toLowerCase(), child: Text(element)
              );
        }).toList()),
      ],
    );
  }
}

class KDropDown2 extends StatelessWidget {
  final List<Map> children;
  final String title;
  final String id;
  const KDropDown2({super.key, required this.children, required this.title, required this.id});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 5,),
        FormBuilderDropdown(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: title
            ),
            name: id, items: children.map((element){
          return DropdownMenuItem(
              value: element['id'], child: Text(element['name'])
          );
        }).toList()),
      ],
    );
  }
}
