
import 'package:get/get.dart';
import 'package:storekepper_desktop/shared/ui/snackbars.dart';

import '../models/salesitem.dart';

class SalesController extends GetxController{
  var salesItem = <SalesItem>[].obs;


  addSalesItem(SalesItem element){
    if(salesItem.value.where((e)=>e.uuid ==element.uuid).isNotEmpty){
      showErrorSnackbar(message: "Item already in list");
    }else{
    salesItem.add(element);
    }
  }

}