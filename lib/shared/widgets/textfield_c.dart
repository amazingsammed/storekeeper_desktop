import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';

import 'colors.dart';

class MyCustomTextfield extends StatelessWidget{
  String labeltext;
  TextEditingController? controller;
  double? width;
  bool isNumber;
  bool bypassValidation;
  bool hasTitle;
  MyCustomTextfield({super.key,
    required this.labeltext,
    this.width,
    this.hasTitle =true,
    this.controller,
    this.isNumber=false,
    this.bypassValidation =false
  });



  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        // width: 300,
        margin: EdgeInsets.all(10),


        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(hasTitle)Text(labeltext,style: TextStyle(fontSize:18,color: Colors.black54),),
            if(hasTitle)SizedBox(height: 10,),
            Container(
              // width: width??300,
              child: TextFormField(

                style: TextStyle(color: Colors.black),
                decoration:  InputDecoration(
                  hintText: labeltext,

                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: MyAppColors.boader),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),

                ),
                controller: controller,
                maxLines: 1,
                validator: (value) {
                  if(bypassValidation){
                    return null;
                  }
                  if (value == null || value.isEmpty) {
                    return 'Please enter $labeltext';
                  }  else if (value.length > 25) {
                    return 'maximum character is 25';
                  }
                    else if (isNumber && value.isNum==false) {
                    return 'This must be a number';
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );

  }


}

// class kDropDown extends StatelessWidget {
//   String labeltext;
//
//   List<String> item;
//   String initialValue;
//   Function(Object?)? onChange;
//   kDropDown({Key? key,required this.item,this.onChange,required this.labeltext,required this.initialValue}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       width: 400,
//       padding: EdgeInsets.only(top: 15.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(labeltext),
//           SizedBox(height: 10,),
//           SizedBox(
//             height: 50,width: 250,
//             child: FormBuilderDropdown(
//               initialValue: initialValue,
//               name: 'options',
//               validator: FormBuilderValidators.required(),
//               decoration:  InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide(
//                     width: 0.5,
//                     style: BorderStyle.solid,
//                   ),),
//
//               ),
//               onChanged: onChange,
//               items: item.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
//               // items: const [
//               //   DropdownMenuItem(value: 0, child: Text('Show textfield')),
//               //   DropdownMenuItem(value: 1, child: Text('Show info text')),
//               // ],
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
// class kDropDown2 extends StatelessWidget {
//   String labeltext;
//
//   List<String> item;
//   String initialValue;
//   Function(Object?)? onChange;
//   kDropDown2({Key? key,required this.item,this.onChange,required this.labeltext,required this.initialValue}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       width: 300,
//       margin: EdgeInsets.all(10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(labeltext),
//           SizedBox(height: 10,),
//           SizedBox(
//             height: 50,width: 250,
//             child: FormBuilderDropdown(
//
//               initialValue: initialValue,
//               name: 'options',
//               validator: FormBuilderValidators.required(),
//               decoration:  InputDecoration(
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: BorderSide(
//                     width: 0.5,
//                     style: BorderStyle.solid,
//                   ),),
//
//               ),
//               onChanged: onChange,
//               items: item.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
//               // items: const [
//               //   DropdownMenuItem(value: 0, child: Text('Show textfield')),
//               //   DropdownMenuItem(value: 1, child: Text('Show info text')),
//               // ],
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }


// class kSearchFeild extends StatelessWidget {
//   String labeltext;
//
//   List<String> item;
//
//   Function(String?)? onChange;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       width: 400,
//       padding: EdgeInsets.only(top: 15.0),
//       child: Row(
//         children: [
//           SizedBox(
//             height: 50,width: 250,
//             child: FormBuilderSearchableDropdown<String>(
//
//               popupProps: const PopupProps.menu(showSearchBox: true),
//               dropdownSearchDecoration: InputDecoration(
//                 hintText: labeltext,
//                 labelText: "Search for ${labeltext}",
//               ),
//               name: 'searchable_dropdown_offline',
//               items: item,
//               decoration: InputDecoration(
//                   labelText: labeltext,
//                   hintText: 'Select ${labeltext}',
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8.0))),
//               filterFn: (country, filter) =>
//                   country.toLowerCase().contains(filter.toLowerCase()),
//               onChanged: onChange,
//             ),
//           ),
//           kSizedbox10
//         ],
//       ),
//     );
//   }
//
//   kSearchFeild({
//     required this.labeltext,
//     required this.item,
//     this.onChange,
//   });
// }
//
//
// class kDateSelector extends StatelessWidget {
//   String labeltext;
//   Function(DateTime?)? onChange;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return   Container(
//       width: 400,
//       padding: EdgeInsets.only(top: 15.0),
//       child: Row(
//         children: [
//
//           SizedBox(
//             height: 50,width: 250,
//             child: FormBuilderDateTimePicker(
//               decoration: InputDecoration(
//                   labelText: labeltext,
//                   border: OutlineInputBorder(
//
//                       borderRadius: BorderRadius.circular(8.0))),
//               inputType: InputType.date,
//               name: labeltext,
//               initialDate: DateTime.now(),
//               onChanged: onChange,
//               format: DateFormat('dd-MM-yyyy'),
//             ),
//           ),
//           kSizedbox10
//         ],
//       ),
//     );
//   }
//
//   kDateSelector({
//     required this.labeltext,
//     this.onChange,
//   });
// }