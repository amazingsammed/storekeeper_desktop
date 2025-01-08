import 'dart:math';

import 'package:flutter/material.dart';


class MyAppColors{
  static Color primary = const Color(0xFF122239);
  static Color secondary = const Color(0xff224462);
  static Color buttonfills = const Color(0xff224462);
  static Color accent = Color(0xfffff);
  static Color boader = Colors.black12;
}

const SizedBox kSizedbox5  =SizedBox(width: 5,height: 5,);
const SizedBox kSizedbox10 =SizedBox(width: 10,height: 10,);
const SizedBox kSizedbox20 =SizedBox(width: 20,height: 20,);
const SizedBox kSizedbox30 =SizedBox(width: 30,height: 30,);
const SizedBox kSizedbox40 =SizedBox(width: 40,height: 40,);


const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));