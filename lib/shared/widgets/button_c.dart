
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/colors.dart';






class PrimaryButton extends StatefulWidget {
  final Function()? onTap;
  final IconData? icon;
  final String? title;
  final double? height;
  final double? width;
  final Color? color;
  final bool hasIcon;
  const PrimaryButton({Key? key,this.onTap,this.title,this.icon,this.height,this.width,this.hasIcon=true, this.color}) : super(key: key);

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {



  @override
  Widget build(BuildContext context) {
    var x =MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all<Color>(widget.color ?? MyAppColors.buttonfills),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      onPressed:
        widget.onTap??(){
          print('add a function');
        },

      child: SizedBox(
        height: 50,
        child: SizedBox(
          height:widget.height,
          width: widget.width,
          child:
            (x<940&&widget.hasIcon)?Icon(widget.icon??Icons.add,color: Colors.white,): Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               if(widget.hasIcon) Icon(widget.icon??Icons.add,color: Colors.white,),
               if(widget.hasIcon) SizedBox(
                  width: 15,
                ),
                Text(widget.title??'Add Product',style: TextStyle(color: Colors.white,fontSize: 18),),
               if(widget.hasIcon) SizedBox(width: 15,)
              ],
            ),

        ),
      ),
    );
  }
}

class SecondaryButtons extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final String? title;
  final double? height;
  final double? width;
  const SecondaryButtons({Key? key,this.icon,this.onTap,this.title, this.height, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var x =MediaQuery.of(context).size.width;
    return ElevatedButton(

        style: ButtonStyle(
elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.black12) ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        onPressed: onTap??(){
      print('add a function');
    }, child: SizedBox(
      height: height??50,
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 10),
        child: x<940?Icon(icon??Icons.add,color: Colors.black,):Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [Icon(icon??Icons.filter_list,color: Colors.black,),SizedBox(width: 10,), Text(title??'Filters',style: TextStyle(color: Colors.black),),SizedBox()],
        ),
      ),
    ));
  }
}
class FilterButtons2 extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  final String? title;
  const FilterButtons2({Key? key,this.icon,this.onTap,this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var x =MediaQuery.of(context).size.width;
    return  SizedBox(
      height: 50,
      child: InkWell(
        onTap: onTap??(){
          print('add a function');
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(6)),
          child: x<900?Icon(icon??Icons.add,color: Colors.black,):Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [Icon(icon??Icons.filter_list,color: Colors.black,),SizedBox(width: 10,), Expanded(child: Text(title??'Filters',style: TextStyle(color: Colors.black),)),SizedBox()],
          ),
        ),
      ),
    );
  }
}
// class DateButton extends StatelessWidget {
//   final String title;
//   final Function()? ontap;
//  final DateTime? date ;
//  DateButton({Key? key, this.title = 'From',this.ontap, this.date}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title,style: TextStyle(color: Colors.black,fontSize: 16),),
//         kSizedbox5,
//         InkWell(
//           onTap: ontap,
//           child: Container(padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black12),
//               borderRadius: BorderRadius.circular(6),
//             ),
//             child: Row(
//               children: [
//                 Text(date?.ddMMyyyy??'Select Date',style: TextStyle(color: Colors.black,fontSize: 16),),kSizedbox10,
//                 Icon(Icons.calendar_today),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//
// }
// class DateButton2 extends StatelessWidget {
//   final String title;
//   final Function()? ontap;
//   final DateTime? date ;
//   DateButton2({Key? key, this.title = 'From',this.ontap, this.date}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//
//       children: [
//         Text(title+":",style: TextStyle(color: Colors.black,fontSize: 16),),
//         kSizedbox5,
//         InkWell(
//           onTap: ontap,
//           child: Container(padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.black12),
//               borderRadius: BorderRadius.circular(6),
//             ),
//             child: Row(
//               children: [
//                 Text(date?.datenum??'Select Date',style: TextStyle(color: Colors.black,fontSize: 16),),kSizedbox10,
//                 Icon(Icons.calendar_today),
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
//
//
// }


class ProgressButton extends StatelessWidget {
  final bool isLoading; // Flag to determine if it's loading or not
  final String buttonText; // Text displayed on the button
  final IconData buttonIcon; // Icon displayed on the button
  final VoidCallback onPressed; // Function to execute when button is pressed
  final Color buttonColor; // Color of the button
  final Color progressColor; // Color of the progress indicator
  final double progressSize; // Size of the progress indicator
  final double buttonHeight; // Height of the button

  const ProgressButton({
    Key? key,
    required this.isLoading,
    required this.buttonText,
    required this.buttonIcon,
    required this.onPressed,
    this.buttonColor = Colors.blue, // Default button color
    this.progressColor = Colors.white, // Default progress indicator color
    this.progressSize = 16.0, // Default progress indicator size
    this.buttonHeight = 48.0, // Default button height
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight, // Control the height of the button
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onPressed, // Disable button during loading
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor, // Button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
        ),
        icon: isLoading
            ? SizedBox(
          width: progressSize, // Dynamic size for the loader
          height: progressSize,
          child: CircularProgressIndicator(
            strokeWidth: 2.0, // Thickness of the progress indicator
            color: progressColor, // Color of the loader
          ),
        )
            : Icon(buttonIcon), // Display icon when not loading
        label: isLoading
            ? const Text("Loading...") // Loading text while loading
            : Text(buttonText), // Button text when not loading
      ),
    );
  }
}


