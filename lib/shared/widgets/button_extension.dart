

import 'package:flutter/material.dart';

import 'package:get/get.dart';

extension Loading on IconButton{
  withLoading(RxBool loading){
    if(loading.value==false) return this;
    return const CircularProgressIndicator();
  }
}