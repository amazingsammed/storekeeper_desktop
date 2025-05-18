import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../validator/validator.dart';

class CustomTextField2 extends StatelessWidget {
  final IconData? icon; // Icon is nullable
  final String label;
  final Color color;
  final TextEditingController? controller; // TextEditingController
  final ValueChanged<String> onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  const CustomTextField2({
    Key? key,
    this.icon, // Optional icon
    required this.label, // Label is required
    required this.color, // Text field color
     this.controller, // Required controller
    required this.onChanged, this.focusNode, this.onFieldSubmitted, // onChanged callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      controller: controller, // Set the controller
      onChanged: onChanged, // Trigger the onChanged function when text changes
      decoration: InputDecoration(
        hintText: label, // Set the hint text
        labelText: label, // Set the label
        //labelStyle: TextStyle(color: color), // Apply color to the label
        prefixIcon: icon != null ? Icon(icon, color: color) : null, // Show icon if provided
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
      cursorColor: color, // Change the cursor color
    );
  }
}

class CustomTextFieldPwd extends StatelessWidget {
  final IconData? icon; // Icon is nullable
  final String label;
  final Color color;
  final TextEditingController? controller; // TextEditingController
  final ValueChanged<String> onChanged;
  final Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  const CustomTextFieldPwd({
    Key? key,
    this.icon, // Optional icon
    required this.label, // Label is required
    required this.color, // Text field color
    this.controller, // Required controller
    required this.onChanged, this.onFieldSubmitted, this.focusNode, // onChanged callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RxBool _obscureText = true.obs;

    return Obx(() => TextField(
      focusNode: focusNode,
      onSubmitted: onFieldSubmitted,
      controller: controller, // Set the controller
      onChanged: onChanged,
      obscureText: _obscureText.value,
      obscuringCharacter: '*',// Trigger the onChanged function when text changes
      decoration: InputDecoration(
        hintText: label, // Set the hint text
        labelText: label,
        suffixIcon: InkWell(child: _obscureText.value ? Icon(Icons.visibility, color: color,): Icon(Icons.visibility_off,),onTap: (){
          //_obscureText.value = !_obscureText.value;
          _obscureText.toggle();
        },),// Set the label
       // labelStyle: TextStyle(color: color), // Apply color to the label
        prefixIcon: icon != null ? Icon(icon, color: color) : null, // Show icon if provided
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
      cursorColor: color, // Change the cursor color
    ));
  }
}

class CustomTextFieldNonEmpty extends StatelessWidget {
  final IconData? icon; // Icon is nullable
  final String label;
  final Color color;
  final TextEditingController? controller; // TextEditingController
  final ValueChanged<String> onChanged;

  const CustomTextFieldNonEmpty({
    super.key,
    this.icon, // Optional icon
    required this.label, // Label is required
    required this.color, // Text field color
    this.controller, // Required controller
    required this.onChanged, // onChanged callback
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Validator.anything,
      controller: controller, // Set the controller
      onChanged: onChanged, // Trigger the onChanged function when text changes
      decoration: InputDecoration(
        hintText: label, // Set the hint text
        labelText: label, // Set the label
        //labelStyle: TextStyle(color: color), // Apply color to the label
        prefixIcon: icon != null ? Icon(icon, color: color) : null, // Show icon if provided
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
      cursorColor: color, // Change the cursor color
    );
  }
}

class CustomTextFieldName extends StatelessWidget {
  final IconData? icon; // Icon is nullable
  final String label;
  final Color color;
  final TextEditingController? controller; // TextEditingController
  final ValueChanged<String> onChanged;

  const CustomTextFieldName({
    super.key,
    this.icon, // Optional icon
    required this.label, // Label is required
    required this.color, // Text field color
    this.controller, // Required controller
    required this.onChanged, // onChanged callback
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Validator.name,
      controller: controller, // Set the controller
      onChanged: onChanged, // Trigger the onChanged function when text changes
      decoration: InputDecoration(
        hintText: label, // Set the hint text
        labelText: label, // Set the label
        //labelStyle: TextStyle(color: color), // Apply color to the label
        prefixIcon: icon != null ? Icon(icon, color: color) : null, // Show icon if provided
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
      cursorColor: color, // Change the cursor color
    );
  }
}

class CustomTextFieldEmail extends StatelessWidget {
  final IconData? icon; // Icon is nullable
  final String label;
  final Color color;
  final TextEditingController? controller; // TextEditingController
  final ValueChanged<String> onChanged;

  const CustomTextFieldEmail({
    Key? key,
    this.icon, // Optional icon
    required this.label, // Label is required
    required this.color, // Text field color
    this.controller, // Required controller
    required this.onChanged, // onChanged callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Validator.email,
      controller: controller, // Set the controller
      onChanged: onChanged, // Trigger the onChanged function when text changes
      decoration: InputDecoration(
        hintText: label, // Set the hint text
        labelText: label, // Set the label
        //labelStyle: TextStyle(color: color), // Apply color to the label
        prefixIcon: icon != null ? Icon(icon, color: color) : null, // Show icon if provided
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
      cursorColor: color, // Change the cursor color
    );
  }
}

class CustomTextFieldPhone extends StatelessWidget {
  final IconData? icon; // Icon is nullable
  final String label;
  final Color color;
  final TextEditingController? controller; // TextEditingController
  final ValueChanged<String> onChanged;

  const CustomTextFieldPhone({
    Key? key,
    this.icon, // Optional icon
    required this.label, // Label is required
    required this.color, // Text field color
    this.controller, // Required controller
    required this.onChanged, // onChanged callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Validator.phoneNumber,
      controller: controller, // Set the controller
      onChanged: onChanged, // Trigger the onChanged function when text changes
      decoration: InputDecoration(
        hintText: label, // Set the hint text
        labelText: label, // Set the label
        //labelStyle: TextStyle(color: color), // Apply color to the label
        prefixIcon: icon != null ? Icon(icon, color: color) : null, // Show icon if provided
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
      cursorColor: color, // Change the cursor color
    );
  }
}

class CustomTextFieldOnlyNumber extends StatelessWidget {
  final IconData? icon; // Icon is nullable
  final String label;
  final Color color;
  final TextEditingController? controller; // TextEditingController
  final ValueChanged<String> onChanged;

  const CustomTextFieldOnlyNumber({
    Key? key,
    this.icon, // Optional icon
    required this.label, // Label is required
    required this.color, // Text field color
    this.controller, // Required controller
    required this.onChanged, // onChanged callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Validator.numbersAndDecimalOnly,
      controller: controller, // Set the controller
      onChanged: onChanged, // Trigger the onChanged function when text changes
      decoration: InputDecoration(
        hintText: label, // Set the hint text
        labelText: label, // Set the label
        //labelStyle: TextStyle(color: color), // Apply color to the label
        prefixIcon: icon != null ? Icon(icon, color: color) : null, // Show icon if provided
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
      cursorColor: color, // Change the cursor color
    );
  }
}

class CustomDatePicker extends StatelessWidget {
  final String label;
  final Color color;
  final TextEditingController? controller;
  final ValueChanged<String> onChanged;

  const CustomDatePicker({
    Key? key,
    required this.label,
    required this.color,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: Validator.anything,
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: label,
        labelText: label,
        prefixIcon: Icon(Icons.calendar_month, color: color),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color),
        ),
      ),
      cursorColor: color,
      onTap: () async {
        final DateTime? date = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2100),
        );
        if (date != null) {
          controller!.text = DateFormat('dd-MM-yyyy').format(date);
        }
      },
    );
  }
}